import 'package:delivery_app2/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
          localRepositoryInterface: Get.find(),
          apiRepository: Get.find(),
        ));
    Get.lazyPut(() => CartController());
  }
}
