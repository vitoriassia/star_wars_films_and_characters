import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/profile_button.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/widgets/sweet_button.dart';

class HeaderApp extends StatelessWidget {
  final Function() onPressProfileButton;
  final Function() onPressSiteButton;
  HeaderApp(this.onPressProfileButton, this.onPressSiteButton);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SweetButton(
              onPressed: onPressProfileButton,
              text: "Site",
              icon: Icons.language,
              textcolor: Colors.white,
              color: kPrimaryColor,
              borderColor: Colors.white,
              isEnable: true),
          ProfileButton(onPressSiteButton),
        ],
      ),
    );
  }
}
