import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/brand.dart';
import '../../domain/repositories/brand_repository.dart';
import '../datasources/brand_local_datasource.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandLocalDataSource localDataSource;

  BrandRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    try {
      final brands = await localDataSource.getBrands();
      return Right(brands);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
