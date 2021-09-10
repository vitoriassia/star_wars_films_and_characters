import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_character/character_tile_widget.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';

class ListOfCharacter extends StatelessWidget {
  final List<CharacterModel> listOfMovies = [
    CharacterModel(
        name: 'Luque Sky',
        image: 'assets/mark.jpg',
        actorName: 'Mark Zukenberg'),
    CharacterModel(
        name: 'Luque Sky',
        image: 'assets/mark.jpg',
        actorName: 'Mark Zukenberg'),
    CharacterModel(
        name: 'Luque Sky',
        image: 'assets/mark.jpg',
        actorName: 'Mark Zukenberg')
  ];
  ListOfCharacter();
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
        isAlwaysShown: true,
        thumbColor: kPrimaryColor.withOpacity(0.9),
        thickness: 6,
        radius: Radius.circular(2),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: ListView.builder(
            itemCount: listOfMovies.length,
            itemBuilder: (context, index) {
              return CharacterTileWidget(
                characterModel: listOfMovies[index],
              );
            },
          ),
        ));
  }
}
