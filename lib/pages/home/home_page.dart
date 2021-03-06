import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';

import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_character/list_of_character_widget.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_favorits/list_of_favorits_widget.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/list_of_movies/list_of_movie_widget.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/moji_widget/moji_widget.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/web_view_site_star_wars/web_view_site_start_wars.dart';
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
      ListOfCharacterWidget(),
      ListOfFavoritsWidget(),
      WebViewStiteStarWars(),
      MojiWidget(),
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
          HeaderApp(
              onPressProfileButton: () {
                _selectedIndex == 3 ? onTabChange(0) : onTabChange(3);
              },
              onPressSiteButton: () {
                _selectedIndex == 4 ? onTabChange(0) : onTabChange(4);
              },
              siteIsSelected: _selectedIndex == 3,
              profileIsSelected: _selectedIndex == 4),
          StreamBuilder<bool>(
            stream: bloc.loadingOut,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.data
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
}
