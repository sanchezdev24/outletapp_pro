import 'package:get/get.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/brand.dart';
import '../../domain/usecases/get_brands_usecase.dart';

class HomeController extends GetxController {
  final GetBrandsUseCase _getBrandsUseCase = sl<GetBrandsUseCase>();

  final RxBool isLoading = false.obs;
  final RxList<Brand> brands = <Brand>[].obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadBrands();
  }

  Future<void> loadBrands() async {
    isLoading.value = true;
    
    final result = await _getBrandsUseCase(NoParams());
    
    result.fold(
      (failure) {
        Get.snackbar('Error', 'No se pudieron cargar las marcas');
      },
      (brandsList) {
        brands.assignAll(brandsList);
      },
    );
    
    isLoading.value = false;
  }

  List<Brand> get filteredBrands {
    if (searchQuery.value.isEmpty) {
      return brands;
    }
    
    return brands
        .where((brand) =>
            brand.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}