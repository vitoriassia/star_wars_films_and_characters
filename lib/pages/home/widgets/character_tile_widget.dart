import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';

class CharacterTileWidget extends StatelessWidget {
  final CharacterModel contactModel;
  CharacterTileWidget({required this.contactModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
      ),
      child: ListTile(
        title: Text(contactModel.name),
        subtitle: Text(contactModel.email),
        leading: CircleAvatar(
          foregroundImage: NetworkImage(contactModel.image),
        ),
      ),
    );
  }
}
