import 'package:catalog_app/pages/home_page.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode
          .light, //Sets the theme of the app to the system theme //By default dark and light can also be used
      theme: ThemeData(
        primarySwatch: Colors.indigo, //Defines the colour of the page
        primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, //Give the data for the dark theme
      ),
      routes: {
        "/": (context) => 
            LoginPage(),
        myRoutes.homeRoute: (context) => HomePage(),
        myRoutes.loginRoute: (context) => LoginPage(),
      }, //Routes are basically raasta, on starting which page to show, and many different predefined routes with an initial routes
    );
  }
}

// '/' is by default routed and home and / route meant the same thing, if both present error given
