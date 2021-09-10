import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';

import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_character/list_of_character.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_movies/list_of_movie_widget.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/widgets/app_scaffold.dart';
import 'package:star_wars_films_and_characters/shared/widgets/header_app.dart';
import 'package:star_wars_films_and_characters/shared/widgets/progress_indicator_yoda.dart';
import 'package:star_wars_films_and_characters/shared/widgets/tab_navigation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;
  late List<Widget> widgetsTab;
  @override
  void initState() {
    super.initState();
    bloc = HomeModule.to.getBloc<HomeBloc>();
    bloc.loadingData();
    widgetsTab = <Widget>[
      ListOfMovieWidget(),
      ListOfCharacter(),
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
  }

  int _selectedIndex = 0;

  void onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomTabNavigationBar: TabNavigation(_selectedIndex, onTabChange),
      body: Column(
        children: [
          HeaderApp(() {
            onTabChange(3);
          }, () {
            onTabChange(4);
          }),
          StreamBuilder<bool>(
            stream: bloc.loadingOut,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.data
                  ? ProgressIndicatorYoda()
                  : Expanded(
                      child:
                          Center(child: widgetsTab.elementAt(_selectedIndex)));
            },
          )
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: StreamBuilder<List<ContactModel>>(
  //       stream: bloc.contactsOut,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return snapshot.data!.isEmpty
  //               ? Container(
  //                   child: Text(
  //                     "Não há contatos cadastrados",
  //                     style:
  //                         TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //                   ),
  //                 )
  //               : SingleChildScrollView(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: snapshot.data!
  //                         .map((contact) =>
  //                             ContactTileWidget(contactModel: contact))
  //                         .toList(),
  //                   ),
  //                 );
  //         } else {
  //           return CircularProgressIndicator();
  //         }
  //       },
  //     ),
  //   );
  // }
}
