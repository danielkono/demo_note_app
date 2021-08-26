import 'package:demo_note_app/pages/favorites/favorites_state.dart';
import 'package:demo_note_app/services/notes_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesNotifier =
    StateNotifierProvider<FavoritesNotifier, FavoriteState>(
        (ref) => FavoritesNotifier(ref.watch(notesService)));

class FavoritesNotifier extends StateNotifier<FavoriteState> {
  final NotesService notesService;
  FavoritesNotifier(this.notesService) : super(FavoriteState([])) {
    state = FavoriteState(
        notesService.notes.where((element) => element.favorite).toList());
  }
}
