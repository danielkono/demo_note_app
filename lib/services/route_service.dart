import 'package:demo_note_app/pages/favorites/favorites_page.dart';
import 'package:demo_note_app/pages/main/main_page.dart';
import 'package:flutter/material.dart';

///class manages routes
class RouteService {
  //all exsting Routes in the app

  static String mainPage = "/";
  static String favoritesPage = "/favoritesPage";

  // provides the route for MaterialApp (in main.dart)
  static Map<String, Widget Function(BuildContext)> routes = {
    mainPage: (_) => MainPage(),
    favoritesPage: (_) => FavoritesPage()
  };
}
