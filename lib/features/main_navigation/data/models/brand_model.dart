import '../../domain/entities/brand.dart';
import '../../../../core/config/database/tables/brand_table.dart';

class BrandModel extends Brand {
  const BrandModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.description,
  });

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: map[BrandTable.columnId],
      name: map[BrandTable.columnName],
      logo: map[BrandTable.columnLogo],
      description: map[BrandTable.columnDescription],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      BrandTable.columnName: name,
      BrandTable.columnLogo: logo,
      BrandTable.columnDescription: description,
    };
  }
}