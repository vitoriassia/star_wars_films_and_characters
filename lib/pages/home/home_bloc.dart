import 'package:star_wars_films_and_characters/core/repositories/home_repository.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final HomeRepository repo;
  HomeBloc(this.repo) {
    this.charactersOut = _characters.stream;
    this._charactersIn = _characters.sink;
  }

  //?STREAMS
  var _characters = BehaviorSubject<List<CharacterModel>>();
  late Stream<List<CharacterModel>> charactersOut;
  late Sink<List<CharacterModel>> _charactersIn;

  Future<void> getContacts() async {
    try {
      var myListContacts = await repo.getContacts();
      _charactersIn.add(myListContacts);
    } catch (e) {
      _characters.addError(e);
    }
  }

  @override
  void dispose() {
    _characters.close();
    _charactersIn.close();
    super.dispose();
  }
}
