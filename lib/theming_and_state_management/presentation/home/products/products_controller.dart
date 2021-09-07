import 'package:delivery_app2/theming_and_state_management/domain/model/products.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final ApiRepository apiRepository;

  ProductsController({required this.apiRepository});

  RxList<Product> productsList = RxList([]);

  @override
  void onInit() {
    loadProducts();
    super.onInit();
  }

  void loadProducts() async {
    final result = await this.apiRepository.getProducts();
    productsList.value = result;
  }
}
