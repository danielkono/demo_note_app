import 'package:demo_note_app/generated/l10n.dart';
import 'package:demo_note_app/pages/favorites/favorites_notifier.dart';
import 'package:demo_note_app/pages/main/main_notifier.dart';
import 'package:demo_note_app/services/route_service.dart';
import 'package:demo_note_app/widgets/notes_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.favorites_page),
      ),
      drawer: RelutionDrawer(),
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.notes[index].title ?? ""),
                  subtitle: Text(state.notes[index].content ?? "-"),
                  trailing: IconButton(
                    icon: Icon(state.notes[index].favorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                    onPressed: () => context
                        .read(mainProvider.notifier)
                        .onFavorite(state.notes[index]),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: state.notes.length)),
    );
  }
}
