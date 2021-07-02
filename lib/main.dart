import 'package:flutter/material.dart';
import 'package:myflutter1/constants.dart';
import 'package:myflutter1/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        accentColor: Colors.white,
        textTheme:  TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: kTextColor ),
          headline2: TextStyle(height: 2,fontSize: 12,color: kTextColor ),

        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090E110),
        accentColor: Color(0xFF323739),
        scaffoldBackgroundColor: Color(0xFF0C0D0E),
        textTheme: TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white70),
              headline2: TextStyle(height: 2,fontSize: 12,color: Colors.white70 ),
        )
      ),
      home:LoadingScreen(),
    );
  }
}
