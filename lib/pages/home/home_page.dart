import 'package:star_wars_films_and_characters/pages/home/home_bloc.dart';
import 'package:star_wars_films_and_characters/pages/home/home_module.dart';

import 'package:flutter/material.dart';
import 'package:star_wars_films_and_characters/shared/widgets/app_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeModule.to.getBloc<HomeBloc>();
    bloc.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(),
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
