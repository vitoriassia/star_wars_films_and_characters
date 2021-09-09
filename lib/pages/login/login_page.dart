import 'dart:async';

import 'package:star_wars_films_and_characters/main.dart';
import 'package:star_wars_films_and_characters/pages/login/login_bloc.dart';
import 'package:star_wars_films_and_characters/pages/login/login_module.dart';
import 'package:star_wars_films_and_characters/pages/login/widgets/login_form.dart';
import 'package:star_wars_films_and_characters/shared/auth/auth_bloc.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _loginBloc = LoginModule.to.getBloc<LoginBloc>();
  late StreamSubscription streamSub;
  @override
  void initState() {
    super.initState();
    streamSub = _loginBloc.statusOut.listen((event) {
      if (event == AuthenticationStatus.success)
        AppModule.to.getBloc<AuthBloc>().login();
    });
  }

  @override
  void dispose() {
    streamSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(
            size: 150,
          ),
          LoginForm(onTap: (value) async => await _loginBloc.login(value)),
          StreamBuilder<AuthenticationStatus>(
            stream: _loginBloc.statusOut,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return snapshot.data! == AuthenticationStatus.loading
                    ? CircularProgressIndicator()
                    : snapshot.data! == AuthenticationStatus.success
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Credenciais Inválidas",
                              style: TextStyle(color: Colors.red),
                            ),
                          );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
