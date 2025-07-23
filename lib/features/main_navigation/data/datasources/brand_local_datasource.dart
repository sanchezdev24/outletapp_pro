import '../../../../core/config/database/database_helper.dart';
import '../../../../core/config/database/tables/brand_table.dart';
import '../models/brand_model.dart';

abstract class BrandLocalDataSource {
  Future<List<BrandModel>> getBrands();
}

class BrandLocalDataSourceImpl implements BrandLocalDataSource {
  final DatabaseHelper databaseHelper;

  BrandLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<List<BrandModel>> getBrands() async {
    final db = await databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(BrandTable.tableName);
    
    return List.generate(maps.length, (i) {
      return BrandModel.fromMap(maps[i]);
    });
  }
}