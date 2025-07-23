import '../../domain/entities/user.dart';
import '../../../../core/config/database/tables/user_table.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map[UserTable.columnId],
      email: map[UserTable.columnEmail],
      name: map[UserTable.columnName],
      createdAt: map[UserTable.columnCreatedAt],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      UserTable.columnEmail: email,
      UserTable.columnName: name,
      UserTable.columnCreatedAt: createdAt,
    };
  }

  Map<String, dynamic> toMapWithPassword(String password) {
    return {
      UserTable.columnEmail: email,
      UserTable.columnName: name,
      UserTable.columnPassword: password,
      UserTable.columnCreatedAt: createdAt,
    };
  }
}