import 'package:star_wars_films_and_characters/main.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';
import 'package:star_wars_films_and_characters/pages/login/login_module.dart';
import 'package:star_wars_films_and_characters/shared/auth/auth_bloc.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var authBloc;
  @override
  void initState() {
    authBloc = AppModule.to.getBloc<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: authBloc.statusOut,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.data ? HomeModule() : LoginModule();
      },
    );
  }
}
