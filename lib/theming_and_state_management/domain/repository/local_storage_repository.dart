import 'package:delivery_app2/theming_and_state_management/domain/model/users.dart';

abstract class LocalRepositoryInterface {
  Future<String> getToken();
  Future<String> saveToken(String token);

  Future<void> clearAllData();

  Future<User> getUser();
  Future<User> saveUser(User user);

  Future<bool> isDarkMode();
  Future<bool> setDarkmode(bool value);
}
