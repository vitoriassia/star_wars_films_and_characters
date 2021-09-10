import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;
  final Widget bottomTabNavigationBar;
  const AppScaffold({required this.body, required this.bottomTabNavigationBar});

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.bottomTabNavigationBar,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          'Filmes Star Wars ',
          style: TextStyle(
              fontFamily: 'StarWars',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[],
      ),
      body: Container(color: Colors.white, child: widget.body),
    );
  }
}
