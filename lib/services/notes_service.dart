import 'package:demo_note_app/models/note_model.dart';
import 'package:demo_note_app/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notesService =
    ChangeNotifierProvider((ref) => NotesService(ref.read(hiveService)));

class NotesService extends ChangeNotifier {
  HiveService hiveService;
  List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;

  NotesService(this.hiveService) {
    hiveService.initHiveService().then((value) {
      hiveService.getNotes().then((value) {
        _notes = value;
        notifyListeners();
      });
    });
  }

  Future<void> addNote(String title, String content, {bool fav = false}) async {
    _notes.add(NoteModel(
        content: content,
        favorite: fav,
        lastModified: DateTime.now(),
        title: title));
    await _saveNotesAndNotify();
  }

  Future<void> deleteNote(NoteModel note) async {
    _notes.removeWhere((element) {
      return element.lastModified.isAtSameMomentAs(note.lastModified);
    });
    await _saveNotesAndNotify();
  }

  Future<void> updateNote(NoteModel note) async {
    _notes.firstWhere(
        (element) => element.lastModified.isAtSameMomentAs(note.lastModified))
      ..content = note.content
      ..favorite = note.favorite
      ..title = note.title
      ..lastModified = DateTime.now();
    await _saveNotesAndNotify();
  }

  Future<void> _saveNotesAndNotify() async {
    await hiveService.saveNotes(notes);
    notifyListeners();
  }
}
