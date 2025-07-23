class UserTable {
  static const String tableName = 'users';
  static const String columnId = 'id';
  static const String columnEmail = 'email';
  static const String columnName = 'name';
  static const String columnPassword = 'password';
  static const String columnCreatedAt = 'created_at';

  static const String createTable = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnEmail TEXT UNIQUE NOT NULL,
      $columnName TEXT NOT NULL,
      $columnPassword TEXT NOT NULL,
      $columnCreatedAt TEXT NOT NULL
    )
  ''';
}