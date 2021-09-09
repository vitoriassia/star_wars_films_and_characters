import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';

class CardMovieWidget extends StatelessWidget {
  final MovieModel movieInfo;

  CardMovieWidget({required this.movieInfo});
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
            Image.asset(
              movieInfo.photo,
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    movieInfo.name,
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
                    movieInfo.releaseDateOf,
                    style: TextStyle(
                        fontFamily: 'StarWars',
                        decorationColor: kPrimaryColor,
                        color: Colors.white,
                        fontSize: 13),
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
}
