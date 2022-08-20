import 'dart:async';
import 'dart:ffi';
import 'dart:html';

import 'package:notes_app/constants/notes.constants.dart' show NotesConstants;
import 'package:notes_app/constants/user.constants.dart' show UserConstants;
import 'package:notes_app/constants/tables.constants.dart' show TablesConstants;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:notes_app/services/crud/crud.exceptions.dart';

class NotesService {
  Database? _db;
  Future<DatabaseNotes> createNote({required DatabaseUser owner}) async {
    final db = _getDatabaseOrThrow();
    final dbUser = await getUser(email: owner.email);
    if (dbUser != owner) {
      throw UserNotFindException();
    } else {
      const text = '';
      final noteId = await db.insert(TablesConstants.noteTable, {
        NotesConstants.userIdColumn: owner.id,
        NotesConstants.textColumn: text,
        NotesConstants.isSyncedWithCloudColumn: 1
      });
      if (noteId == 0) {
        throw CouldNotCreateNoteException();
      } else {
        final note = DatabaseNotes(
            id: noteId, text: text, userId: owner.id, isSyncedWithCloud: true);
        _notes.add(note);
        _notesStreamController.add(_notes);
        return note;
      }
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      return db;
    }
  }

  List<DatabaseNotes> _notes = [];

  final _notesStreamController =
      StreamController<List<DatabaseNotes>>.broadcast();
  Future<void> _cacheNotes() async {
    final allNotes = await getAllNodes();
    _notes = allNotes.toList();
    _notesStreamController.add(_notes);
  }

  Future<DatabaseNotes> updateNote(
      {required DatabaseNotes note, required String text}) async {
    final db = _getDatabaseOrThrow();
    final result = await db.update(
        TablesConstants.noteTable,
        {
          NotesConstants.textColumn: text,
          NotesConstants.isSyncedWithCloudColumn: 0,
        },
        where: 'id = ?',
        whereArgs: [note.id]);
    if (result == 0) {
      throw CouldNotUpdateNote();
    } else {
      final updatedNote = await getNote(id: note.id);
      _notes.removeWhere((note) => note.id == note.id);
      _notes.add(updatedNote);
      _notesStreamController.add(_notes);
      return updatedNote;
    }
  }

  Future<Iterable<DatabaseNotes>> getAllNodes() async {
    final db = _getDatabaseOrThrow();
    final allNotes = await db.query(TablesConstants.noteTable);
    return allNotes.map((note) => DatabaseNotes.fromRow(note));
  }

  Future<DatabaseNotes> getNote({required int id}) async {
    final db = _getDatabaseOrThrow();
    final note = await db.query(TablesConstants.noteTable,
        limit: 1, where: 'id = ?', whereArgs: [id]);
    if (note.isEmpty) {
      throw CouldNotFindNote();
    } else {
      final singleNote = DatabaseNotes.fromRow(note.first);
      _notes.removeWhere((note) => note.id == id);
      _notes.add(singleNote);
      _notesStreamController.add(_notes);
      return singleNote;
    }
  }

  Future<int> deleteAllNotesOfUser() async {
    final db = _getDatabaseOrThrow();
    final numberOfDeletions = await db.delete(TablesConstants.noteTable);
    _notes = [];
    _notesStreamController.add(_notes);
    return numberOfDeletions;
  }

  Future<int> deleteNote({required int id}) async {
    final db = _getDatabaseOrThrow();
    final deleteNote = await db
        .delete(TablesConstants.noteTable, where: 'id = ?', whereArgs: [id]);
    if (deleteNote == 0) {
      throw CouldNotDeleteNoteException();
    } else {
      _notes.removeWhere((note) => note.id == id);
      _notesStreamController.add(_notes);
      return deleteNote;
    }
  }

  Future<DatabaseUser> getUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final results = await db.query(TablesConstants.userTable,
        limit: 1, where: 'email = ?', whereArgs: [email.toLowerCase()]);
    if (results.isEmpty) {
      throw UserNotFindException();
    } else {
      return DatabaseUser.fromRow(results.first);
    }
  }

  Future<int> deleteUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final int deletedCount = await db.delete(TablesConstants.userTable,
        where: 'email = ?', whereArgs: [email.toLowerCase()]);
    if (deletedCount != 1) {
      throw CouldNotDeleteUserException();
    }
    return deletedCount;
  }

  Future<DatabaseUser> createUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final result = await db.query(TablesConstants.userTable,
        limit: 1, where: 'email = ?', whereArgs: [email.toLowerCase()]);
    if (result.isNotEmpty) {
      throw UserAlreadyExistsException();
    }
    final userId = await db.insert(TablesConstants.userTable,
        {UserConstants.emailColumn: email.toLowerCase()});
    return DatabaseUser(id: userId, email: email);
  }

  Future<void> open() async {
    if (_db == null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, TablesConstants.dbName);
      final db = await openDatabase(dbPath);
      _db = db;
      await db.execute(UserConstants.createUserTable);
      await db.execute(NotesConstants.createNotesTable);
      await _cacheNotes();
    } on MissingPlatformDirectoryException {
      throw UnableToGetPlatformDirectoryException();
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      await db.close();
      _db = null;
    }
  }
}

class DatabaseUser {
  final int id;
  final String email;
  const DatabaseUser({required this.id, required this.email});
  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[UserConstants.idColumn] as int,
        email = map[UserConstants.emailColumn] as String;

  @override
  String toString() => 'Person, Id: $id, email = $email';

  @override
  bool operator ==(covariant DatabaseUser other);

  @override
  int get hashCode => id.hashCode;
}

class DatabaseNotes {
  final int id;
  final String text;
  final int userId;
  final bool isSyncedWithCloud;

  const DatabaseNotes({
    required this.id,
    required this.text,
    required this.userId,
    required this.isSyncedWithCloud,
  });

  DatabaseNotes.fromRow(Map<String, Object?> map)
      : id = map[NotesConstants.idColumn] as int,
        text = map[NotesConstants.textColumn] as String,
        userId = map[NotesConstants.textColumn] as int,
        isSyncedWithCloud =
            (map[NotesConstants.isSyncedWithCloudColumn] as int) == 1
                ? true
                : false;

  @override
  String toString() =>
      'Note, Id: $id, Text: $text, userId: $userId, isSincedWithCloud: $isSyncedWithCloud';
  @override
  bool operator ==(covariant DatabaseNotes other);

  @override
  int get hashCode => id.hashCode;
}
