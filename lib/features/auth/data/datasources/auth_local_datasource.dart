import 'package:sqflite/sqflite.dart';
import '../../../../core/config/database/database_helper.dart';
import '../../../../core/config/database/tables/user_table.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;

  AuthLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<UserModel> login(String email, String password) async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      UserTable.tableName,
      where: '${UserTable.columnEmail} = ? AND ${UserTable.columnPassword} = ?',
      whereArgs: [email, password],
    );

    if (maps.isEmpty) {
      throw Exception('Credenciales incorrectas');
    }

    return UserModel.fromMap(maps.first);
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final db = await databaseHelper.database;
    
    // Verificar si el email ya existe
    final existingUser = await db.query(
      UserTable.tableName,
      where: '${UserTable.columnEmail} = ?',
      whereArgs: [email],
    );

    if (existingUser.isNotEmpty) {
      throw Exception('El email ya está registrado');
    }

    final userModel = UserModel(
      id: 0,
      email: email,
      name: name,
      createdAt: DateTime.now().toIso8601String(),
    );

    final id = await db.insert(
      UserTable.tableName,
      userModel.toMapWithPassword(password),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return UserModel(
      id: id,
      email: email,
      name: name,
      createdAt: userModel.createdAt,
    );
  }
}