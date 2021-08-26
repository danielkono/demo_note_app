import 'package:demo_note_app/generated/l10n.dart';
import 'package:demo_note_app/services/notes_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notes = watch(notesService).notes;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.app_name),
      ),
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index].title ?? ""),
                  subtitle: Text(notes[index].content ?? "-"),
                  onTap: () {
                    context.read(notesService).deleteNote(notes[index]);
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: notes.length)),
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
                    decoration: InputDecoration(hintText: "Enter yor title"),
                  ),
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      controller: contentController,
                      decoration: InputDecoration(
                          hintText: "Enter your note",
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
                          label: Text("close")),
                      TextButton.icon(
                          onPressed: () {
                            if (contentController.text.isNotEmpty) {
                              String title = titleController.text;
                              if (title.isEmpty) {
                                title = "Note created: ${DateTime.now()}";
                              }
                              context
                                  .read(notesService)
                                  .addNote(title, contentController.text);
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(Icons.add),
                          label: Text("add new note")),
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
