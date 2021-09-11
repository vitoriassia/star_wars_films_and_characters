import 'package:star_wars_films_and_characters/shared/enums.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';

class FavoritsModel {
  String title;
  int id;
  String subtitle;
  String? image;
  TypeFavorit typeFavorit;
  FavoritsModel(
      this.id, this.title, this.subtitle, this.image, this.typeFavorit);

  factory FavoritsModel.fromMovie(MovieModel characterModel) => FavoritsModel(
      characterModel.id,
      characterModel.name,
      characterModel.releaseDateOf,
      characterModel.photo,
      TypeFavorit.Movie);

  factory FavoritsModel.fromCharacters(CharacterModel characterModel) =>
      FavoritsModel(characterModel.id, characterModel.name, '',
          characterModel.image, TypeFavorit.Character);
}
