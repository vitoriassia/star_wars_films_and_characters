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
              child: AnimatedList(
                key: listKey,
                initialItemCount: bloc.listOfFavorits.length,
                itemBuilder: (context, index, animation) {
                  return slideIt(
                    context,
                    index,
                    animation,
                  ); // Refer step 3
                },
              ),
            ))
        : Center(
            child: Text(
              'Nenhum favorito selecionado.',
              style: optionStyle,
              textAlign: TextAlign.center,
            ),
          );
  }

  Widget slideIt(
    BuildContext context,
    int index,
    animation,
  ) {
    FavoritsModel item = bloc.listOfFavorits[index];

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: FavoritsCardItem(
            favoritsModel: item,
            removeItem: () async {
              listKey.currentState!.removeItem(
                  index, (_, animation) => slideIt(context, index, animation),
                  duration: const Duration(milliseconds: 400));
              await Future.delayed(Duration(milliseconds: 600));
              bloc.removeItembyFavoritModel(item);
              setState(() {});
            }),
      ),
    );
  }
}
