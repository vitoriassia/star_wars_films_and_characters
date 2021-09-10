import 'package:star_wars_films_and_characters/core/services/api.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';

class HomeRepository {
  final Api _api;
  HomeRepository(this._api);
  Future<List<CharacterModel>> getContacts() async {
    var response = await _api.getDataFrom(
        "?format=json&results=15&page=1&inc=gender,name,email,picture&nat=br");
    await Future.delayed(Duration(seconds: 2));
    List<CharacterModel> newList = response.data["results"]
        .map<CharacterModel>((contact) => CharacterModel.fromJson(contact))
        .toList();
    return newList;
  }
}
