import 'package:demo_note_app/models/note_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String _notesKey = "_notesKey";

final hiveService = Provider((ref) => HiveService());

class HiveService {
  bool _hasInit = false;

  Future<void> initHiveService() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
    _hasInit = true;
  }

  Future<List<NoteModel>> getNotes() async {
    if (_hasInit) {
      final tempNotes = (await Hive.openBox<List?>(_notesKey)).get(_notesKey);

      return tempNotes != null ? List.castFrom(tempNotes) : [];
    } else {
      return [];
    }
  }

  Future<void> saveNotes(List<NoteModel> notes) async {
    if (_hasInit) {
      return (await Hive.openBox<List<dynamic>?>(_notesKey))
          .put(_notesKey, notes);
    }
  }
}
