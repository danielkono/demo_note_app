import 'package:demo_note_app/generated/l10n.dart';
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
      await notesService.addNote(
          S.current.note_created_at(DateTime.now().toString()), content);
    }
    //state = MainState(notesService.notes);
  }

  Future<void> onFavorite(NoteModel note) async {
    await notesService.updateNote(NoteModel(
        lastModified: note.lastModified,
        content: note.content,
        favorite: !note.favorite,
        title: note.title));
  }
}
