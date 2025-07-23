import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/brand.dart';

abstract class BrandRepository {
  Future<Either<Failure, List<Brand>>> getBrands();
}