import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_character/character_tile_widget.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/enums.dart';
import 'package:star_wars_films_and_characters/shared/models/favortis_model.dart';

class ListOfCharacterWidget extends StatelessWidget {
  final bloc = HomeModule.to.getBloc<HomeBloc>();

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
            itemCount: bloc.characters.length,
            itemBuilder: (context, index) {
              return CharacterTileWidget(
                onTapFavorit: (bool value) {
                  value
                      ? bloc.addItemFavoritModel(FavoritsModel.fromCharacters(
                          bloc.characters[index],
                        ))
                      : bloc.removeItemFavoritModel(
                          bloc.characters[index].id, TypeFavorit.Character);
                },
                characterModel: bloc.characters[index],
              );
            },
          ),
        ));
  }
}
