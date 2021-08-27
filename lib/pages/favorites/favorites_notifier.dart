import 'package:demo_note_app/pages/favorites/favorites_state.dart';
import 'package:demo_note_app/services/notes_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>(
        (ref) => FavoritesNotifier(ref.watch(notesService)));

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final NotesService notesService;
  FavoritesNotifier(this.notesService) : super(FavoritesState([])) {
    state = FavoritesState(
        notesService.notes.where((element) => element.favorite).toList());
  }
}
