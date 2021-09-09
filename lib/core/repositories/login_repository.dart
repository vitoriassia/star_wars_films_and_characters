import 'package:star_wars_films_and_characters/pages/login/login_model.dart';

class LoginRepository {
  Future<bool> login(LoginModel loginModel) async {
    await Future.delayed(Duration(seconds: 6));
    if (loginModel.userName == 'teste' && loginModel.password == 'teste')
      return true;
    else
      throw "Credenciais Inválida";
  }
}
