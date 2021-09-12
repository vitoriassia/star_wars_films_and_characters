import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/widgets/web_view_widget.dart';

class WebViewStiteStarWars extends StatefulWidget {
  @override
  _WebViewStiteStarWarsState createState() => _WebViewStiteStarWarsState();
}

class _WebViewStiteStarWarsState extends State<WebViewStiteStarWars> {
  bool loadingSite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewApp(
          onPageStarted: (value) {
            setState(() {
              loadingSite = true;
            });
          },
          onPageFinish: (value) {
            setState(() {
              loadingSite = false;
            });
          },
          url: 'https://www.starwars.com/community',
        ),
      ],
    );
  }
}
