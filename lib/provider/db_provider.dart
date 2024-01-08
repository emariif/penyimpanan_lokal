import 'package:flutter/foundation.dart';
import 'package:penyimpanan_lokal/data/models/note.dart';
import 'package:penyimpanan_lokal/helper/database_helper.dart';

class DbProvider extends ChangeNotifier {
  List<Note> _notes = [];
  late DatabaseHelper _dbHelper;

  List<Note> get notes => _notes;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllNotes();
  }

  void _getAllNotes() async {
    _notes = await _dbHelper.getNotes();
    notifyListeners();
  }
}