import 'package:delivery_app2/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/theme.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepository apiRepository;

  SplashController({
    required this.localRepositoryInterface,
    required this.apiRepository,
  });

  @override
  void onInit() {
    validateTheme();
    super.onInit();
  }

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != 'null') {
      print('going home.......');
      final user = await apiRepository.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    } else {
      print('going login.......');
      Get.offNamed(DeliveryRoutes.login);
    }
  }

  void validateTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode();
    Get.changeTheme(isDark ? darkTheme : lightTheme);
  }
}
