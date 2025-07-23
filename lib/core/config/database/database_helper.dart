import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'tables/user_table.dart';
import 'tables/brand_table.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _databaseName = 'outletapp.db';
  static const int _databaseVersion = 1;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(UserTable.createTable);
    await db.execute(BrandTable.createTable);
    await _insertInitialData(db);
  }

  Future<void> _insertInitialData(Database db) async {
    // Insertar marcas iniciales
    final brands = [
      {'name': 'Nike', 'logo': 'https://via.placeholder.com/100', 'description': 'Just Do It'},
      {'name': 'Adidas', 'logo': 'https://via.placeholder.com/100', 'description': 'Impossible is Nothing'},
      {'name': 'Puma', 'logo': 'https://via.placeholder.com/100', 'description': 'Forever Faster'},
      {'name': 'Zara', 'logo': 'https://via.placeholder.com/100', 'description': 'Fashion Forward'},
      {'name': 'H&M', 'logo': 'https://via.placeholder.com/100', 'description': 'Fashion and Quality'},
      {'name': 'Uniqlo', 'logo': 'https://via.placeholder.com/100', 'description': 'LifeWear'},
      {'name': 'Calvin Klein', 'logo': 'https://via.placeholder.com/100', 'description': 'Modern American Luxury'},
      {'name': 'Tommy Hilfiger', 'logo': 'https://via.placeholder.com/100', 'description': 'Classic American Cool'},
    ];

    for (var brand in brands) {
      await db.insert('brands', brand);
    }
  }
}