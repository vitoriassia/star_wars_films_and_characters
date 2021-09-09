import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';

class ProfileButton extends StatelessWidget {
  final Function() onPress;
  ProfileButton(this.onPress);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 30,
        child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.person, color: kPrimaryColor)),
      ),
    );
  }
}
