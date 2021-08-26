import 'package:demo_note_app/pages/favorites/favorites_page.dart';
import 'package:demo_note_app/pages/main/main_page.dart';
import 'package:flutter/material.dart';

class RouteService {
  static String mainPage = "/";
  static String favoritesPage = "/favoritesPage";

  static Map<String, Widget Function(BuildContext)> routes = {
    mainPage: (_) => MainPage(),
    favoritesPage: (_) => FavoritesPage()
  };
}
