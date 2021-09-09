import 'package:flutter/material.dart';

class SweetButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;
  final Color textcolor;
  final Color color;
  final Color borderColor;
  final bool isEnable;
  final bool? animatedText;
  final String? imageIcon;
  const SweetButton(
      {required this.onPressed,
      required this.text,
      required this.icon,
      required this.textcolor,
      required this.color,
      required this.borderColor,
      required this.isEnable,
      this.imageIcon,
      this.animatedText})
      : super();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 8,
          textStyle: TextStyle(color: textcolor),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
              side: isEnable
                  ? BorderSide(color: borderColor, width: 2)
                  : BorderSide.none)),
      onPressed: isEnable ? onPressed : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          imageIcon != null
              ? Image.asset(imageIcon!, width: 40, height: 40)
              : Icon(
                  icon,
                  color: isEnable ? textcolor : Colors.grey[600],
                ),
          SizedBox(width: 16.0),
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Play',
                color: isEnable ? textcolor : Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
