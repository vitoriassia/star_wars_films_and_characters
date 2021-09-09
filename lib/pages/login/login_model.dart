class LoginModel {
  String userName;
  String password;
  LoginModel({required this.userName, required this.password});

  @override
  String toString() {
    return 'UserName: $userName Password: $password';
  }
}
