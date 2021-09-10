import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';
import 'package:star_wars_films_and_characters/shared/widgets/heart_animation_widget.dart';

class CardMovieWidget extends StatefulWidget {
  final MovieModel movieInfo;

  CardMovieWidget({required this.movieInfo});

  @override
  _CardMovieWidgetState createState() => _CardMovieWidgetState();
}

class _CardMovieWidgetState extends State<CardMovieWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: double.infinity,
        height: 210,
        color: kPrimaryColorDark,
        child: Column(
          children: <Widget>[
            // FadeInImage.assetNetwork(
            //   placeholder: 'assets/loadings/loadingRooms2.gif',
            //   image: movieInfo.photo,
            //   height: 180,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            Stack(
              children: [
                Image.asset(
                  widget.movieInfo.photo,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                buildActions
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.movieInfo.name,
                    style: TextStyle(
                        decorationColor: kPrimaryColor,
                        fontFamily: 'StarWars',
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 17,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                    width: 5,
                  ),
                  Text(
                    widget.movieInfo.releaseDateOf,
                    style: TextStyle(
                        decorationColor: kPrimaryColor,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11),
                  )
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

  Widget get buildActions {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final color = Colors.white;

    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeartAnimationWidget(
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
        ],
      ),
    );
  }
}
