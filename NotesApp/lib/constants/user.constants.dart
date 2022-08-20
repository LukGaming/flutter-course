class UserConstants {
  static String idColumn = 'id';
  static String emailColumn = 'email';
  static String createUserTable = '''
      CREATE TABLE IF NOT EXISTS "user" (
        "id"	INTEGER NOT NULL,
        "email"	TEXT NOT NULL UNIQUE,
        PRIMARY KEY("id" AUTOINCREMENT)
      );
''';
}
