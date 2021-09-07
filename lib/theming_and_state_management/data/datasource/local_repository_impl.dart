import 'package:delivery_app2/theming_and_state_management/domain/model/users.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token = 'TOKEN';
const _pref_name = 'NAME';
const _pref_username = 'USERNAME';
const _pref_image = 'IMAGE';
const _pref_dark_theme = 'DARK_THEME';

class LocalRepositoryImplementation extends LocalRepositoryInterface {
  @override
  Future<void> clearAllData() async {
    SharedPreferences shared_preferences =
        await SharedPreferences.getInstance();
    shared_preferences.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences shared_preferences =
        await SharedPreferences.getInstance();

    final token = shared_preferences.getString(_pref_token);
    if (token != null) return token;
    return 'null';
  }

  @override
  Future<String> saveToken(String token) async {
    SharedPreferences shared_preferences =
        await SharedPreferences.getInstance();
    shared_preferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> getUser() async {
    SharedPreferences shared_preferences =
        await SharedPreferences.getInstance();
    final username = shared_preferences.getString(_pref_username);
    final name = shared_preferences.getString(_pref_name);
    final image = shared_preferences.getString(_pref_image);

    if (username != null && name != null && image != null) {
      final user = User(
        name: name,
        username: username,
        image: image,
      );
      return user;
    }

    final user2 = User(
      name: 'name',
      username: 'username',
      image: 'assets/logo.png',
    );
    return user2;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences shared_preferences =
        await SharedPreferences.getInstance();
    shared_preferences.setString(_pref_username, user.username);
    shared_preferences.setString(_pref_name, user.name);
    shared_preferences.setString(_pref_image, user.image);

    return user;
  }

  @override
  Future<bool> isDarkMode() async {
    SharedPreferences shared_preferences =
        await SharedPreferences.getInstance();
    final isDark = shared_preferences.getBool(_pref_dark_theme);
    if (isDark != null) {
      return isDark;
    } else {
      return true;
    }
  }

  @override
  Future<bool> setDarkmode(bool value) async {
    SharedPreferences shared_preferences =
        await SharedPreferences.getInstance();
    shared_preferences.setBool(_pref_dark_theme, value);
    return value;
  }
}
