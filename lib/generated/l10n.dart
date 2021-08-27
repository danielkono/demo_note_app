// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Demo Note`
  String get app_name {
    return Intl.message(
      'Demo Note',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Main Page`
  String get main_page_title {
    return Intl.message(
      'Main Page',
      name: 'main_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites_page {
    return Intl.message(
      'Favorites',
      name: 'favorites_page',
      desc: '',
      args: [],
    );
  }

  /// ` Add new note`
  String get add_new_note {
    return Intl.message(
      ' Add new note',
      name: 'add_new_note',
      desc: '',
      args: [],
    );
  }

  /// `close`
  String get close {
    return Intl.message(
      'close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Enter here your title`
  String get enter_title_hint {
    return Intl.message(
      'Enter here your title',
      name: 'enter_title_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter here your content`
  String get enter_content_hint {
    return Intl.message(
      'Enter here your content',
      name: 'enter_content_hint',
      desc: '',
      args: [],
    );
  }

  /// `Note created: {time}`
  String note_created_at(Object time) {
    return Intl.message(
      'Note created: $time',
      name: 'note_created_at',
      desc: '',
      args: [time],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
