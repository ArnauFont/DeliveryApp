import 'package:delivery_app2/theming_and_state_management/domain/model/users.dart';

class LoginResponse {
  final String token;
  final User user;

  LoginResponse(this.token, this.user);
}
