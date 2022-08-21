import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(""" 
      CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      mobile TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'contacts.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createContact(String name, String mobile) async {
    final db = await SqlHelper.db();
    final data = {'name': name, 'mobile': mobile};
    final id = await db.insert('contacts', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getContacts() async {
    final db = await SqlHelper.db();
    return db.query('contacts');
  }

  static Future<List<Map<String, dynamic>>> getContactByID(int id) async {
    final db = await SqlHelper.db();
    return await db.query('contacts',
        where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateContact(int id, String name, String mobile) async {
    final db = await SqlHelper.db();
    final data = {
      'name': name,
      'mobile': mobile,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('contacts', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<int> deleteContact(int id) async {
    final db = await SqlHelper.db();
    var result = await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
