import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context){
  return AppBar(
    leading: BackButton(),
    iconTheme: IconThemeData(
        color: Color(0xff846db6) //change your color here
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}