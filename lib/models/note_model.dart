import 'package:hive_flutter/hive_flutter.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;
  @HiveField(2)
  bool favorite;
  @HiveField(3)
  DateTime lastModified;

  NoteModel(
      {this.title,
      this.content,
      this.favorite = false,
      required this.lastModified});
}
