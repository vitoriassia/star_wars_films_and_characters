import 'package:star_wars_films_and_characters/core/repositories/home_repository.dart';
import 'package:star_wars_films_and_characters/shared/models/contact_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final HomeRepository repo;
  HomeBloc(this.repo) {
    this.contactsOut = _contacts.stream;
    this._contactIn = _contacts.sink;
  }

  //?STREAMS
  var _contacts = BehaviorSubject<List<ContactModel>>();
  late Stream<List<ContactModel>> contactsOut;
  late Sink<List<ContactModel>> _contactIn;

  Future<void> getContacts() async {
    try {
      var myListContacts = await repo.getContacts();
      _contactIn.add(myListContacts);
    } catch (e) {
      _contacts.addError(e);
    }
  }

  @override
  void dispose() {
    _contacts.close();
    _contactIn.close();
    super.dispose();
  }
}
