import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BlocBase {
  AuthBloc() {
    this.statusOut = status.stream;
    this._statusIn = status.sink;
  }

  //?STREAMS
  var status = BehaviorSubject<bool>.seeded(false);
  late Stream<bool> statusOut;
  late Sink<bool> _statusIn;

  login() async {
    _statusIn.add(true);
  }

  logout() async {
    _statusIn.add(false);
  }

  @override
  void dispose() {
    status.close();
    _statusIn.close();
    super.dispose();
  }
}
