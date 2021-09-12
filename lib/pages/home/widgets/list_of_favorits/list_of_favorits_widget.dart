import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_favorits/favorits_card_item.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/favortis_model.dart';

class ListOfFavoritsWidget extends StatefulWidget {
  @override
  _ListOfFavoritsWidgetState createState() => _ListOfFavoritsWidgetState();
}

class _ListOfFavoritsWidgetState extends State<ListOfFavoritsWidget> {
  final bloc = HomeModule.to.getBloc<HomeBloc>();

  /// Will used to access the Animated list
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return bloc.listOfFavorits.isNotEmpty
        ? RawScrollbar(
            isAlwaysShown: true,
            thumbColor: kPrimaryColor.withOpacity(0.9),
            thickness: 6,
            radius: Radius.circular(2),
            child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: ListView.builder(
                  itemCount: bloc.listOfFavorits.length,
                  itemBuilder: (context, index) => FavoritsCardItem(
                      favoritsModel: bloc.listOfFavorits[index],
                      removeItem: () async {
                        bloc.removeItembyFavoritModel(
                            bloc.listOfFavorits[index]);
                        setState(() {});
                      }),
                )))
        : Center(
            child: Text(
              'Nenhum favorito selecionado.',
              style: optionStyle,
              textAlign: TextAlign.center,
            ),
          );
  }
}
