import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/enums.dart';
import 'package:star_wars_films_and_characters/shared/models/favortis_model.dart';

class FavoritsCardItem extends StatefulWidget {
  final FavoritsModel favoritsModel;

  FavoritsCardItem({required this.favoritsModel});

  @override
  _FavoritsCardItemState createState() => _FavoritsCardItemState();
}

class _FavoritsCardItemState extends State<FavoritsCardItem> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: double.infinity,
        height: 150,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            // FadeInImage.assetNetwork(
            //   placeholder: 'assets/loadings/loadingRooms2.gif',
            //   image: favoritsModel.photo,
            //   height: 180,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            Stack(
              children: [
                HeadCardFavorits(
                  typeFavorit: widget.favoritsModel.typeFavorit,
                )
                // buildActions
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            widget.favoritsModel.image,
                          )),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.redAccent,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.favoritsModel.title,
                        style: TextStyle(
                            fontFamily: 'StarWars',
                            color: kPrimaryColor,
                            fontSize: 11),
                      ),
                      Text(
                        widget.favoritsModel.subtitle,
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8,
      margin: EdgeInsets.all(10),
    );
  }

  // Widget get buildActions {
  //   final icon = widget.favoritsModel.isFavorit
  //       ? Icons.favorite
  //       : Icons.favorite_outline;
  //   final color = Colors.white;

  //   return Container(
  //     padding: EdgeInsets.all(4),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         HeartAnimationWidget(
  //           child: IconButton(
  //             icon: Icon(
  //               icon,
  //               color: color,
  //             ),
  //             onPressed: () => setState(() {
  //               widget.favoritsModel.isFavorit =
  //                   !widget.favoritsModel.isFavorit;
  //             }),
  //           ),
  //           isAnimating: widget.favoritsModel.isFavorit,
  //           duration: Duration(milliseconds: 400),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class HeadCardFavorits extends StatelessWidget {
  final TypeFavorit? typeFavorit;

  HeadCardFavorits({
    this.typeFavorit,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: typeFavorit == TypeFavorit.Movie
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.movie,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Filme',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.movie,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Personagem',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4),
            topLeft: Radius.circular(4),
          ),
        ),
      ),
    );
  }
}
