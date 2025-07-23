import 'package:get/get.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../../../core/config/routes/app_routes.dart';

class AuthController extends GetxController {
  final LoginUseCase _loginUseCase = sl<LoginUseCase>();
  final RegisterUseCase _registerUseCase = sl<RegisterUseCase>();
  final LogoutUseCase _logoutUseCase = sl<LogoutUseCase>();

  final RxBool isLoading = false.obs;
  final Rx<User?> currentUser = Rx<User?>(null);
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> login(String email, String password) async {
    if (isLoading.value) return;
    
    isLoading.value = true;
    
    final result = await _loginUseCase(LoginParams(email: email, password: password));
    
    result.fold(
      (failure) {
        Get.snackbar(
          'Error',
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.errorContainer,
          colorText: Get.theme.colorScheme.onErrorContainer,
          duration: const Duration(seconds: 3),
        );
      },
      (user) {
        currentUser.value = user;
        Get.snackbar(
          'Bienvenido',
          'Sesión iniciada correctamente',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.primaryContainer,
          colorText: Get.theme.colorScheme.onPrimaryContainer,
          duration: const Duration(seconds: 2),
        );
        Get.offAllNamed(AppRoutes.main);
      },
    );
    
    isLoading.value = false;
  }

  Future<void> register(String name, String email, String password) async {
    if (isLoading.value) return;
    
    isLoading.value = true;
    
    final result = await _registerUseCase(RegisterParams(
      name: name, 
      email: email, 
      password: password
    ));
    
    result.fold(
      (failure) {
        Get.snackbar(
          'Error',
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.errorContainer,
          colorText: Get.theme.colorScheme.onErrorContainer,
          duration: const Duration(seconds: 3),
        );
      },
      (user) {
        currentUser.value = user;
        Get.snackbar(
          'Registro exitoso',
          'Cuenta creada correctamente',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.primaryContainer,
          colorText: Get.theme.colorScheme.onPrimaryContainer,
          duration: const Duration(seconds: 2),
        );
        Get.offAllNamed(AppRoutes.main);
      },
    );
    
    isLoading.value = false;
  }

  Future<void> logout() async {
    if (isLoading.value) return;
    
    isLoading.value = true;
    
    final result = await _logoutUseCase(NoParams());
    
    result.fold(
      (failure) {
        Get.snackbar(
          'Error',
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.theme.colorScheme.errorContainer,
          colorText: Get.theme.colorScheme.onErrorContainer,
          duration: const Duration(seconds: 2),
        );
      },
      (_) {
        currentUser.value = null;
        Get.offAllNamed(AppRoutes.login);
      },
    );
    
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }
}