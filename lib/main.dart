import 'package:star_wars_films_and_characters/core/services/api.dart';
import 'package:star_wars_films_and_characters/pages/root_page.dart';
import 'package:star_wars_films_and_characters/shared/auth/auth_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppModule());
}

class AppModule extends ModuleWidget {
  //Inject the blocs
  @override
  List<Bloc<BlocBase>> get blocs => [Bloc((i) => AuthBloc())];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [Dependency((i) => Api())];

  //main widget
  @override
  Widget get view => MaterialApp(
      title: 'Flutter App with Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage());

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<AppModule>.of();
}
