import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_movies/card_movie_widget.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/models/movie_model.dart';

class ListOfMovieWidget extends StatelessWidget {
  final List<MovieModel> listOfMovies =
      HomeModule.to.getBloc<HomeBloc>().movies;
  ListOfMovieWidget();
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
            itemCount: listOfMovies.length,
            itemBuilder: (context, index) {
              return CardMovieWidget(
                movieInfo: listOfMovies[index],
              );
            },
          ),
        ));
  }
}
