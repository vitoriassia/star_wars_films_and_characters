import 'package:star_wars_films_and_characters/pages/login/login_model.dart';
import 'package:star_wars_films_and_characters/shared/utils/form_controller.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final FormController formController = FormController();
  final Function(LoginModel loginModel) onTap;
  final LoginModel loginModel = LoginModel(userName: '', password: '');
  LoginForm({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
          key: formController.key,
          child: Column(
            children: [
              TextFormField(
                onSaved: (value) => loginModel.userName = value!,
                validator: (value) => value == null || value.isEmpty
                    ? "O Email não pode ser nulo"
                    : null,
                decoration: InputDecoration(
                  labelText: "Nome do Usuário",
                ),
              ),
              TextFormField(
                onSaved: (value) => loginModel.password = value!,
                validator: (value) => value == null || value.isEmpty
                    ? "A senha não pode ser nulo"
                    : null,
                decoration: InputDecoration(
                  labelText: "Senha",
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formController.validate()) onTap(loginModel);
                      },
                      child: Text("Entrar"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3))),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
