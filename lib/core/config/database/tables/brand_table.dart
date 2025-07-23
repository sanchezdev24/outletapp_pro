class BrandTable {
  static const String tableName = 'brands';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnLogo = 'logo';
  static const String columnDescription = 'description';

  static const String createTable = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL,
      $columnLogo TEXT NOT NULL,
      $columnDescription TEXT NOT NULL
    )
  ''';
}