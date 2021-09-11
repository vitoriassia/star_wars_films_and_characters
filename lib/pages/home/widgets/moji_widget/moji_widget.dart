import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:star_wars_films_and_characters/shared/constants.dart';
import 'package:star_wars_films_and_characters/shared/widgets/sweet_button.dart';

class MojiWidget extends StatefulWidget {
  @override
  _MojiWidgetState createState() => _MojiWidgetState();
}

class _MojiWidgetState extends State<MojiWidget> {
  bool isCustomize = false;
  FluttermojiFunctions _fluttermojiFunctions = FluttermojiFunctions();
  String mysvg = '';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mysvg == '' || isCustomize
                  ? FluttermojiCircleAvatar(
                      radius: 100, backgroundColor: Colors.white)
                  : SvgPicture.string(
                      mysvg,
                      height: 150,
                    ),
              isCustomize
                  ? SweetButton(
                      onPressed: () async {
                        final encoded =
                            await _fluttermojiFunctions.encodeMySVGtoString();
                        String newSvg = _fluttermojiFunctions
                            .decodeFluttermojifromString(encoded);
                        setState(() {
                          isCustomize = false;
                          mysvg = newSvg;
                        });
                      },
                      text: "Confirmar Alterações",
                      icon: Icons.check_circle,
                      textcolor: Colors.white,
                      color: kPrimaryColor,
                      borderColor: Colors.white,
                      isEnable: true)
                  : Container()
            ],
          ),
        ),
        isCustomize
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                child: FluttermojiCustomizer(
                  outerTitleText: 'Clique para Salvar:',
                  //scaffoldHeight: 400,
                  scaffoldWidth: 0.0,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: SweetButton(
                    onPressed: () {
                      setState(() {
                        isCustomize = true;
                      });
                    },
                    text: "Editar",
                    icon: Icons.edit,
                    textcolor: Colors.white,
                    color: kPrimaryColor,
                    borderColor: Colors.white,
                    isEnable: true),
              ),
      ],
    );
  }
}
