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

  Future<void> addMojiToDb() async {
    await _dataBase.addMojiToDatabase(this.myMoji);
  }

  Future<void> getMyMojiDataBase() async {
    this.myMoji = await _dataBase.getMoji();
  }

  List<FavoritsModel> get listOfFavorits => _favorits;

  addItemFavoritModel(FavoritsModel favoritsModel) =>
      _favorits.add(favoritsModel);
  removeItemFavoritModel(int favoritsId, TypeFavorit type) =>
      _favorits.removeWhere(
          (element) => element.id == favoritsId && element.typeFavorit == type);
  removeItembyFavoritModel(
    FavoritsModel favoritsModel,
  ) {
    _favorits.remove(favoritsModel);
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
