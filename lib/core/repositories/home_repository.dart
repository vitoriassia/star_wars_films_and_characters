import 'package:star_wars_films_and_characters/core/services/api.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';

class HomeRepository {
  final Api _api;
  HomeRepository(this._api);
  Future<List<CharacterModel>> getCharacters() async {
    //  var response = await _api.getDataFrom(
    //     "?format=json&results=15&page=1&inc=gender,name,email,picture&nat=br");
    await Future.delayed(Duration(seconds: 2));
    // List<CharacterModel> newList = response.data["results"]
    //     .map<CharacterModel>((contact) => CharacterModel.fromJson(contact))
    //     .toList();
    // return newList;
    return [
      CharacterModel(
          id: 1,
          name: 'Luque Sky',
          image: 'assets/mark.jpg',
          actorName: 'Mark sd'),
      CharacterModel(
          id: 2,
          name: 'Luque Sky',
          image: 'assets/mark.jpg',
          actorName: 'Mark Zukesdnberg'),
      CharacterModel(
          id: 3,
          name: 'Luque Sky',
          image: 'assets/mark.jpg',
          actorName: 'Mark Zukenddberg')
    ];
  }

  Future<List<MovieModel>> getMovies() async {
    var response = await _api.getDataFrom("films/");

    List<MovieModel> newList = response.data["results"]
        .map<MovieModel>((contact) => MovieModel.fromJson(contact))
        .toList();
    return newList;
    // return [
    //   MovieModel(1, false, 'A Ameaça Fantasma - Episódigo 1',
    //       'assets/banner-1.jpeg', '21/08/2019'),
    //   MovieModel(2, false, 'A Ameaça Fantasma - Episódigo 1',
    //       'assets/banner-1.jpeg', '21/08/2019'),
    //   MovieModel(3, false, 'A Ameaça Fantasma - Episódigo 1',
    //       'assets/banner-1.jpeg', '21/08/2019')
    // ];
  }
}
