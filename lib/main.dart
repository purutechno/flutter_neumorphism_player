import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphism_player/Services/navigationServices.dart';
import 'package:flutter_neumorphism_player/Services/router.dart';
import 'package:flutter_neumorphism_player/Services/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          //this is what you want
          accentColor: Colors.grey[800],
        ),
        onGenerateRoute: generateRoute,
        navigatorKey: navigatorKey,
        initialRoute: Routes.SongList);
  }
}
