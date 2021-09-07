import 'package:delivery_app2/theming_and_state_management/presentation/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(
          localRepositoryInterface: Get.find(),
          apiRepository: Get.find(),
        ));
  }
}
