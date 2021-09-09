import 'package:star_wars_films_and_characters/core/services/api.dart';
import 'package:star_wars_films_and_characters/shared/models/contact_model.dart';

class HomeRepository {
  final Api _api;
  HomeRepository(this._api);
  Future<List<ContactModel>> getContacts() async {
    var response = await _api.getDataFrom(
        "?format=json&results=15&page=1&inc=gender,name,email,picture&nat=br");
    await Future.delayed(Duration(seconds: 2));
    List<ContactModel> newList = response.data["results"]
        .map<ContactModel>((contact) => ContactModel.fromJson(contact))
        .toList();
    return newList;
  }
}
