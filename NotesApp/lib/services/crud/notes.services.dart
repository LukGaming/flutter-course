import 'dart:ffi';
import 'dart:html';

import 'package:notes_app/constants/notes.constants.dart' show NotesConstants;
import 'package:notes_app/constants/user.constants.dart' show UserConstants;
import 'package:notes_app/constants/tables.constants.dart' show TablesConstants;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class CouldNotDeleteNoteException {
}


class DatabaseAlreadyOpenException implements Exception {}

class UnableToGetPlatformDirectoryException implements Exception {}

class DatabaseIsNotOpen implements Exception {}

class CouldNotDeleteUserException {}

class UserAlreadyExistsException {}

class UserNotFindException {}

class CouldNotCreateNoteException {}

class NotesService {
  Database? _db;

  Future<DatabaseNotes> createNode({required DatabaseUser owner}) async {
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
        final note = DatabaseNotes(id: noteId, text: text, userId: owner.id, isSyncedWithCloud: true)
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
  Future<DatabaseNotes> getNote({required int id}) async {
    final db = _getDatabaseOrThrow();
    final note = await db.query(TablesConstants.noteTable, limit: 1, where: 'id = ?', whereArgs: [id]);
    if(note.isEmpty){
      
    }
  }
  Future<int> deleteAllNotesOfUser() async {
    final db = _getDatabaseOrThrow();
    return await db.delete(TablesConstants.noteTable);
  }
  Future<int> deleteNote({required int id }) async {
    final db = _getDatabaseOrThrow();
    final deleteNote = await db.delete(TablesConstants.noteTable, where: 'id = ?', whereArgs: [id]);
    if(deleteNote == 0){
      throw CouldNotDeleteNoteException();
    }
    else{
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
