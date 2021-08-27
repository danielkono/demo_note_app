import 'package:demo_note_app/generated/l10n.dart';
import 'package:demo_note_app/pages/main/main_notifier.dart';
import 'package:demo_note_app/widgets/notes_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(mainProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.app_name),
      ),
      drawer: RelutionDrawer(),
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.notes[index].title ?? ""),
                  subtitle: Text(state.notes[index].content ?? "-"),
                  onLongPress: () {
                    context
                        .read(mainProvider.notifier)
                        .deleteNote(state.notes[index]);
                  },
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddNoteDialog(context),
      ),
    );
  }

  Future<void> _showAddNoteDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        TextEditingController titleController = TextEditingController();
        TextEditingController contentController = TextEditingController();
        bool forceClose = false;
        return WillPopScope(
          onWillPop: () async {
            if (!forceClose && contentController.text.isNotEmpty) {
              return false;
            }
            return true;
          },
          child: Dialog(
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration:
                        InputDecoration(hintText: S.current.enter_title_hint),
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      controller: contentController,
                      decoration: InputDecoration(
                          hintText: S.current.enter_content_hint,
                          border: InputBorder.none),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            forceClose = true;
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel),
                          label: Text(S.current.close)),
                      TextButton.icon(
                          onPressed: () {
                            if (contentController.text.isNotEmpty) {
                              context.read(mainProvider.notifier).createNewNote(
                                  contentController.text,
                                  title: titleController.text);
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(Icons.add),
                          label: Text(S.current.add_new_note)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
