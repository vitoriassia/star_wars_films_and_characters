import 'package:star_wars_films_and_characters/core/services/api.dart';
import 'package:star_wars_films_and_characters/core/services/data_base_app.dart';
import 'package:star_wars_films_and_characters/shared/enums.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:star_wars_films_and_characters/shared/models/favortis_model.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';

class HomeRepository {
  final Api _api;
  final AppDatabaseProvider _dataBase;
  HomeRepository(this._api, this._dataBase);
  Future<List<CharacterModel>> getCharacters() async {
    var response = await _api.getDataFrom("people/");

    List<CharacterModel> newList = response.data["results"]
        .map<CharacterModel>((contact) => CharacterModel.fromJson(contact))
        .toList();
    return newList;
  }

  Future<List<MovieModel>> getMovies() async {
    var response = await _api.getDataFrom("films/");

    List<MovieModel> newList = response.data["results"]
        .map<MovieModel>((contact) => MovieModel.fromJson(contact))
        .toList();
    return newList;
  }

  Future<List<FavoritsModel>> getAllFavorit() async {
    return await _dataBase.getAllFavorit();
  }

  Future<void> addMoji(String moji) async {
    await _dataBase.addMojiToDatabase(moji);
  }

  Future<void> addFavorit(FavoritsModel favoritsModel) async {
    await _dataBase.addFavoritToDatabase(favoritsModel);
  }

  Future<void> deleteFavorit(int id, TypeFavorit type) async {
    await _dataBase.deleteFavoritWithId(
        id, type == TypeFavorit.Movie ? 'movie' : 'character');
  }

  Future<String> getMyMoji() async {
    return await _dataBase.getMoji();
  }
}
