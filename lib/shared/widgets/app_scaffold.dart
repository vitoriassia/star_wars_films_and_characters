import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/widgets/header_app.dart';
import 'package:star_wars_films_and_characters/shared/widgets/tab_navigation.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;

  const AppScaffold({
    required this.body,
  });

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Filmes',
      style: optionStyle,
    ),
    Text(
      'Personagens',
      style: optionStyle,
    ),
    Text(
      'Favoritos',
      style: optionStyle,
    ),
    Text(
      'Site',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];
  int _selectedIndex = 0;
  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabNavigation(_selectedIndex, onTabChange),
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
      body: Column(
        children: [
          HeaderApp(() {
            onTabChange(3);
          }, () {
            onTabChange(4);
          }),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}
