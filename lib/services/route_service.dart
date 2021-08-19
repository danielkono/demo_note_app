import 'package:demo_note_app/pages/main/main_page.dart';
import 'package:flutter/material.dart';

class RouteService {
  static String mainPage = "/";

  static Map<String, Widget Function(BuildContext)> routes = {
    mainPage: (_) => MainPage()
  };
}
