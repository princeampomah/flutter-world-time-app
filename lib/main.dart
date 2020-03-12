
import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location_page.dart';
import 'package:world_time_app/pages/home_page.dart';
import 'package:world_time_app/pages/loading_page.dart';

void main() =>
    runApp(MaterialApp(
      title: 'World Time',
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(), //the default route if the home property is not specified
        '/choose_location_page' : (context) => ChooseLocation(),
        '/home_page' : (context) => Home()
    },
    ));
