// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(time) => "Note created: ${time}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add_new_note": MessageLookupByLibrary.simpleMessage(" Add new note"),
        "app_name": MessageLookupByLibrary.simpleMessage("Demo Note"),
        "close": MessageLookupByLibrary.simpleMessage("close"),
        "enter_content_hint":
            MessageLookupByLibrary.simpleMessage("Enter here your content"),
        "enter_title_hint":
            MessageLookupByLibrary.simpleMessage("Enter here your title"),
        "favorites_page": MessageLookupByLibrary.simpleMessage("Favorites"),
        "main_page_title": MessageLookupByLibrary.simpleMessage("Main Page"),
        "note_created_at": m0
      };
}
