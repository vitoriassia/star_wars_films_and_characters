import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';

class CharacterTileWidget extends StatelessWidget {
  final CharacterModel characterModel;
  CharacterTileWidget({required this.characterModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: kPrimaryColor, width: 1),
      ),
      child: ListTile(
        title: Text(characterModel.name),
        subtitle: Text(characterModel.actorName),
        trailing: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: AssetImage(characterModel.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(
              color: kPrimaryColor,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
