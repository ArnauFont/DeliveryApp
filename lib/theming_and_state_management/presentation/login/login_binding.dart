import 'package:delivery_app2/theming_and_state_management/presentation/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
          localRepositoryInterface: Get.find(),
          apiRepository: Get.find(),
        ));
  }
}
