import 'package:star_wars_films_and_characters/core/repositories/home_repository.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';

class HomeBloc extends BlocBase {
  final HomeRepository repo;
  List<MovieModel> _movies = [];
  List<CharacterModel> _characters = [];
  HomeBloc(this.repo) {
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

  @override
  void dispose() {
    _loading.close();
    _loadingIn.close();
    super.dispose();
  }
}
