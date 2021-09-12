import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/character_model.dart';
import 'package:star_wars_films_and_characters/shared/widgets/heart_animation_widget.dart';

class CharacterTileWidget extends StatefulWidget {
  final CharacterModel characterModel;
  final Function(bool) onTapFavorit;
  CharacterTileWidget(
      {required this.characterModel, required this.onTapFavorit});

  @override
  _CharacterTileWidgetState createState() => _CharacterTileWidgetState();
}

class _CharacterTileWidgetState extends State<CharacterTileWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          widget.characterModel.isFavorit = !widget.characterModel.isFavorit;
          widget.onTapFavorit(widget.characterModel.isFavorit);
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: kPrimaryColor, width: 2),
        ),
        child: ListTile(
          title: Text(widget.characterModel.name),
          trailing: buildActions,
          leading: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    widget.characterModel.image ?? 'assets/no-photo.png',
                  )),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget get buildActions {
    final icon = widget.characterModel.isFavorit
        ? Icons.favorite
        : Icons.favorite_outline;
    final color = kPrimaryColor;

    return Container(
      padding: EdgeInsets.all(4),
      child: HeartAnimationWidget(
        child: IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: () => setState(() {
            widget.characterModel.isFavorit = !widget.characterModel.isFavorit;
            widget.onTapFavorit(widget.characterModel.isFavorit);
          }),
        ),
        isAnimating: widget.characterModel.isFavorit,
        duration: Duration(milliseconds: 400),
      ),
    );
  }
}
