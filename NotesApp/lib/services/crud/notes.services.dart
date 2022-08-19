import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

const idCol = 'id';
const emailCol = 'email';

class DatabaseUser {
  final int id;
  final String email;

  const DatabaseUser({required this.id, required this.email});
  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idCol] as int,
        email = map[emailCol] as String;
  @override
  String toString() => 'Person, Id: $id, email = $email';

  @override
  bool operator ==(covariant DatabaseUser other);
}
