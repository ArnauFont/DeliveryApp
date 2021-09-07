import 'package:delivery_app2/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:delivery_app2/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:delivery_app2/theming_and_state_management/domain/request/login_request.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

enum LoginState { loading, initial }

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepository apiRepository;

  LoginController({
    required this.localRepositoryInterface,
    required this.apiRepository,
  });

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial.obs;

  Future<bool> logIn() async {
    final username = usernameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState(LoginState.loading);
      final loginResponse = await apiRepository.login(
        LoginRequest(username, password),
      );
      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);
      loginState(LoginState.initial);
      return true;
    } catch (Exception) {
      loginState(LoginState.initial);
      return false;
    }
  }
}
