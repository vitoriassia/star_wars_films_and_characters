import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/pages/home/widgets/profile_button.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/widgets/sweet_button.dart';

class HeaderApp extends StatelessWidget {
  final Function() onPressProfileButton;
  final Function() onPressSiteButton;
  final bool siteIsSelected;
  final bool profileIsSelected;
  HeaderApp(
      {required this.onPressProfileButton,
      required this.onPressSiteButton,
      required this.siteIsSelected,
      required this.profileIsSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SweetButton(
                onPressed: onPressProfileButton,
                text: "Site",
                icon: Icons.language,
                textcolor: siteIsSelected ? Colors.white : kPrimaryColor,
                color: siteIsSelected ? kPrimaryColor : Colors.white,
                borderColor: siteIsSelected ? Colors.white : kPrimaryColor,
                isEnable: true),
            ProfileButton(onPressSiteButton, profileIsSelected),
          ],
        ),
      ),
    );
  }
}
