import 'package:star_wars_films_and_characters/core/repositories/home_repository.dart';
import 'package:star_wars_films_and_characters/core/services/api.dart';
import 'package:star_wars_films_and_characters/core/services/data_base_app.dart';
import 'package:star_wars_films_and_characters/main.dart';
import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class HomeModule extends ModuleWidget {
  //Inject the blocs
  @override
  List<Bloc<BlocBase>> get blocs => [
        Bloc(
          (i) => HomeBloc(
            to.getDependency<HomeRepository>(),
            to.getDependency<AppDatabaseProvider>(),
          ),
        ),
      ];

  //Inject the dependencies
  @override
  List<Dependency> get dependencies => [
        Dependency((i) => HomeRepository(AppModule.to.getDependency<Api>())),
        Dependency((i) => AppDatabaseProvider.db),
      ];

  //main widget
  @override
  Widget get view => HomePage();

  //shortcut to pick up dependency injections from this module
  static Inject get to => Inject<HomeModule>.of();
}
