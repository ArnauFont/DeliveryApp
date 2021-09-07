import 'package:delivery_app2/theming_and_state_management/domain/model/products.dart';
import 'package:delivery_app2/theming_and_state_management/domain/model/users.dart';
import 'package:delivery_app2/theming_and_state_management/domain/request/login_request.dart';
import 'package:delivery_app2/theming_and_state_management/domain/response/login_response.dart';

abstract class ApiRepository {
  Future<User> getUserFromToken(String token);
  Future<LoginResponse> login(LoginRequest request);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
}
