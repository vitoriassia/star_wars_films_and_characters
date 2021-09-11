import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_favorits/favorits_card_item.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';

class ListOfFavoritsWidget extends StatelessWidget {
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
          child: SingleChildScrollView(
            child: Column(
              children: bloc.listOfFavorits
                  .map(
                    (favorit) => FavoritsCardItem(
                      favoritsModel: favorit,
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
