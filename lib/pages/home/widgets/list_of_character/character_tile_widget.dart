import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:star_wars_films_and_characters/shared/widgets/heart_animation_widget.dart';

class CharacterTileWidget extends StatefulWidget {
  final CharacterModel characterModel;
  CharacterTileWidget({required this.characterModel});

  @override
  _CharacterTileWidgetState createState() => _CharacterTileWidgetState();
}

class _CharacterTileWidgetState extends State<CharacterTileWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: kPrimaryColor, width: 1),
      ),
      child: ListTile(
        title: Text(widget.characterModel.name),
        subtitle: Text(widget.characterModel.actorName),
        trailing: buildActions,
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: AssetImage(widget.characterModel.image),
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

  Widget get buildActions {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final color = Colors.red;

    return Container(
      padding: EdgeInsets.all(4),
      child: HeartAnimationWidget(
        child: IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: () => setState(() {
            isLiked = !isLiked;
          }),
        ),
        isAnimating: isLiked,
        duration: Duration(milliseconds: 400),
      ),
    );
  }
}
