import 'package:star_wars_films_and_characters/core/repositories/home_repository.dart';
import 'package:star_wars_films_and_characters/core/services/data_base_app.dart';
import 'package:star_wars_films_and_characters/shared/enums.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_films_and_characters/shared/models/favortis_model.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';

class HomeBloc extends BlocBase {
  final HomeRepository repo;
  final AppDatabaseProvider _dataBase;
  List<MovieModel> _movies = [];
  List<CharacterModel> _characters = [];
  List<FavoritsModel> _favorits = [];
  String myMoji = '';
  HomeBloc(this.repo, this._dataBase) {
    this.loadingOut = _loading.stream;
    this._loadingIn = _loading.sink;
  }

  List<MovieModel> get movies => _movies;
  List<CharacterModel> get characters => _characters;

  //?STREAMS
  var _loading = BehaviorSubject<bool>.seeded(false);
  late Stream<bool> loadingOut;
  late Sink<bool> _loadingIn;

  Future<void> loadingData() async {
    _loadingIn.add(true);
    await loadingListOfCharacters();
    await loadingListOfMovies();
    await getMyMojiDataBase();
    await loadingMyFavorits();
    _loadingIn.add(false);
  }

  Future<void> loadingListOfCharacters() async {
    try {
      var newList = await repo.getCharacters();
      _characters.addAll(newList);
    } catch (e) {
      _loading.addError(e);
    }
  }

  Future<void> loadingListOfMovies() async {
    try {
      var newList = await repo.getMovies();
      _movies.addAll(newList);
    } catch (e) {
      _loading.addError(e);
    }
  }

  Future<void> loadingMyFavorits() async {
    try {
      var newList = await _dataBase.getAllFavorit();
      _favorits.addAll(newList);
      refreshListCharactersAndMoviesOfFavorits();
    } catch (e) {
      _loading.addError(e);
    }
  }

  void refreshListCharactersAndMoviesOfFavorits() {
    _favorits.forEach((favorit) {
      favorit.typeFavorit == TypeFavorit.Character
          ? _characters.forEach((character) {
              if (favorit.id == character.id) character.isFavorit = true;
            })
          : _movies.forEach((movie) {
              if (favorit.id == movie.id) movie.isFavorit = true;
            });
    });
  }

  Future<void> addMojiToDb() async {
    await _dataBase.addMojiToDatabase(this.myMoji);
  }

  Future<void> addFavoritDb(FavoritsModel favoritsModel) async {
    await _dataBase.addFavoritToDatabase(favoritsModel);
  }

  Future<void> removeFavoritDb(int id, TypeFavorit type) async {
    await _dataBase.deleteFavoritWithId(
        id, type == TypeFavorit.Movie ? 'movie' : 'character');
  }

  Future<void> getMyMojiDataBase() async {
    this.myMoji = await _dataBase.getMoji();
  }

  List<FavoritsModel> get listOfFavorits => _favorits;

  addItemFavoritModel(FavoritsModel favoritsModel) async {
    _favorits.add(favoritsModel);
    await addFavoritDb(favoritsModel);
  }

  removeItemFavoritModel(int favoritsId, TypeFavorit type) async {
    _favorits.removeWhere(
        (element) => element.id == favoritsId && element.typeFavorit == type);
    await removeFavoritDb(favoritsId, type);
  }

  removeItembyFavoritModel(
    FavoritsModel favoritsModel,
  ) async {
    _favorits.remove(favoritsModel);
    await removeFavoritDb(favoritsModel.id, favoritsModel.typeFavorit);
    favoritsModel.typeFavorit == TypeFavorit.Character
        ? _characters.forEach((element) {
            if (element.id == favoritsModel.id) element.isFavorit = false;
          })
        : _movies.forEach((element) {
            if (element.id == favoritsModel.id) element.isFavorit = false;
          });
  }

  @override
  void dispose() {
    _loading.close();
    _loadingIn.close();
    super.dispose();
  }
}
