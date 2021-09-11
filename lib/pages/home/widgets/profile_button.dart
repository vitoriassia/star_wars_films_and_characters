import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';

class ProfileButton extends StatelessWidget {
  final Function() onPress;
  final bool isSelected;
  ProfileButton(this.onPress, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        color: isSelected ? kPrimaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isSelected ? Colors.white : kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 10,
        child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.person,
                color: isSelected ? Colors.white : kPrimaryColor)),
      ),
    );
  }
}
