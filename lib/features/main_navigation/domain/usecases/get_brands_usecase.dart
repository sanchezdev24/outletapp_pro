import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/brand.dart';
import '../repositories/brand_repository.dart';

class GetBrandsUseCase implements UseCase<List<Brand>, NoParams> {
  final BrandRepository repository;

  GetBrandsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Brand>>> call(NoParams params) async {
    return await repository.getBrands();
  }
}