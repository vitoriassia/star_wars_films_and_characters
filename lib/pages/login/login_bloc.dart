import 'package:star_wars_films_and_characters/core/repositories/login_repository.dart';
import 'package:star_wars_films_and_characters/pages/login/login_model.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {
  final LoginRepository repo;
  LoginBloc(this.repo) {
    this.statusOut = status.stream;
    this._statusIn = status.sink;
  }

  //?STREAMS
  var status = BehaviorSubject<AuthenticationStatus>();
  late Stream<AuthenticationStatus> statusOut;
  late Sink<AuthenticationStatus> _statusIn;

  Future<void> login(LoginModel loginModel) async {
    _statusIn.add(AuthenticationStatus.loading);
    try {
      var response = await repo.login(loginModel);
      if (response)
        _statusIn.add(AuthenticationStatus.success);
      else
        _statusIn.add(AuthenticationStatus.failed);
    } catch (e) {
      status.addError(e);
      _statusIn.add(AuthenticationStatus.failed);
    }
  }

  @override
  void dispose() {
    status.close();
    _statusIn.close();
    super.dispose();
  }
}
