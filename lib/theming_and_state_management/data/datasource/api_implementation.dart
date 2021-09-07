import 'package:delivery_app2/theming_and_state_management/data/in_mem_products.dart';
import 'package:delivery_app2/theming_and_state_management/domain/model/products.dart';
import 'package:delivery_app2/theming_and_state_management/domain/model/users.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:delivery_app2/theming_and_state_management/domain/response/login_response.dart';
import 'package:delivery_app2/theming_and_state_management/domain/request/login_request.dart';

class ApiImplementation extends ApiRepository {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    if (token == 'AA000') {
      return User(
        image: 'assets/arnau_font.png',
        username: 'arnau@font.com',
        name: 'Arnau Font',
      );
    }
    if (token == 'AA001') {
      return User(
        image: 'assets/angela_gonzalez.png',
        username: 'angela@font.com',
        name: 'Angela Gonzalez',
      );
    }
    throw Exception("User not found: " + token);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    await Future.delayed(Duration(seconds: 1));
// TODO: change username check later
    if (request.username == 'arnau' && request.password == '1234') {
      return LoginResponse(
          'AA000',
          User(
            image: 'assets/arnau_font.png',
            username: 'arnau@font.com',
            name: 'Arnau Font',
          ));
    }
    if (request.username == 'angela' && request.password == '12345') {
      return LoginResponse(
          'AA001',
          User(
            image: 'assets/angela_gonzalez.png',
            username: 'angela@font.com',
            name: 'Angela Gonzalez',
          ));
    }

    throw Exception("User not found: " + request.username);
  }

  @override
  Future<void> logout(String token) async {
    print('Removing token: ' + token);
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(seconds: 1));
    return products;
  }
}
