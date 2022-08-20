class NotesConstants {
  static String idColumn = 'id';
  static String textColumn = 'text';
  static String userIdColumn = 'user_id';
  static String isSyncedWithCloudColumn = 'is_sinced_with_could';
  static String createNotesTable = '''
      CREATE TABLE IF NOT EXISTS "notes" (
        "id"	INTEGER NOT NULL,
        "text"	TEXT,
        "is_synced_with_cloud"	INTEGER DEFAULT 0,
        PRIMARY KEY("id" AUTOINCREMENT)
      );''';
}
