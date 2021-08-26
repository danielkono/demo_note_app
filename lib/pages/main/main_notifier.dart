import 'package:demo_note_app/models/note_model.dart';
import 'package:demo_note_app/pages/main/main_state.dart';
import 'package:demo_note_app/services/notes_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainProvider = StateNotifierProvider<MainNotifier, MainState>(
    (ref) => MainNotifier(ref.watch(notesService)));

class MainNotifier extends StateNotifier<MainState> {
  final NotesService notesService;

  MainNotifier(this.notesService) : super(MainState([])) {
    state = MainState(notesService.notes);
  }

  Future<void> deleteNote(NoteModel note) async {
    await notesService.deleteNote(note);
    //state = MainState(notesService.notes);
  }

  Future<void> createNewNote(String content, {String? title}) async {
    if (title != null && title.isNotEmpty) {
      await notesService.addNote(title, content);
    } else {
      await notesService.addNote("Note created: ${DateTime.now()}", content);
    }
    //state = MainState(notesService.notes);
  }

  Future<void> addToFavorites(NoteModel note) async {
    await notesService.deleteNote(note);
    await notesService.addNote(
        note.title ?? "Note created: ${DateTime.now()}", note.content ?? "-",
        fav: true);
  }

  Future<void> deleteFromFavorites(NoteModel note) async {
    if (note.favorite) {
      await notesService.deleteNote(note);
      await notesService.addNote(
          note.title ?? "Note created: ${DateTime.now()}", note.content ?? "-",
          fav: false);
    }
  }
}
