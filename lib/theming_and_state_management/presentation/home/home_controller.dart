import 'package:delivery_app2/theming_and_state_management/domain/model/users.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepository apiRepository;

  HomeController({
    required this.localRepositoryInterface,
    required this.apiRepository,
  });

  Rx<User> user = Rx<User>(User(
    name: 'name',
    username: 'username',
    image: 'assets/logo.png',
  ));

  Rx<int> indexSelected = 0.obs;
  RxBool isDark = true.obs;

  @override
  void onInit() {
    loadTheme();
    super.onInit();
  }

  @override
  void onReady() {
    loadUser();
    super.onReady();
  }

  void loadUser() {
    localRepositoryInterface.getUser().then((value) {
      user(value);
    });
  }

  void updateIndexSelected(int index) {
    indexSelected(index);
  }

  void loadTheme() async {
    localRepositoryInterface.isDarkMode().then((value) {
      isDark(value);
    });

    print(isDark.value);
  }

  bool changeTheme(bool value) {
    isDark(value);
    localRepositoryInterface.setDarkmode(value);
    return value;
  }

  Future<void> logOut() async {
    final token = await localRepositoryInterface.getToken();
    await apiRepository.logout(token);
    await localRepositoryInterface.clearAllData();
  }
}
