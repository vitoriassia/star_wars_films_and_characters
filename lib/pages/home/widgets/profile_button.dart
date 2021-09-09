import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final Function() onPress;
  ProfileButton(this.onPress);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                'assets/icon-profile.png',
                fit: BoxFit.fill,
              ),
            )),
      ),
    );
  }
}
