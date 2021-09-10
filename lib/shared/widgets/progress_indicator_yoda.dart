import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';

class ProgressIndicatorYoda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/yoda-loading.gif'),
        Text(
          "Carregando Filmes e personagens...",
          style: kAppTitleBlack.copyWith(fontFamily: 'StarWars'),
        )
      ],
    );
  }
}
