import 'package:get_it/get_it.dart';
import '../config/database/database_helper.dart';
import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/main_navigation/data/datasources/brand_local_datasource.dart';
import '../../features/main_navigation/data/repositories/brand_repository_impl.dart';
import '../../features/main_navigation/domain/repositories/brand_repository.dart';
import '../../features/main_navigation/domain/usecases/get_brands_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final databaseHelper = DatabaseHelper();
  await databaseHelper.database;
  sl.registerLazySingleton(() => databaseHelper);

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<BrandLocalDataSource>(
    () => BrandLocalDataSourceImpl(sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<BrandRepository>(
    () => BrandRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetBrandsUseCase(sl()));
}