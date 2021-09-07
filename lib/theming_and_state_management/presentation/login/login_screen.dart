import 'package:delivery_app2/theming_and_state_management/presentation/login/login_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/theme.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

final logoSize = 50.0;

class LoginScreen extends GetWidget<LoginController> {
  void logIn() async {
    final result = await controller.logIn();
    if (result) {
      Get.offNamed(DeliveryRoutes.home);
    } else {
      Get.snackbar(
        'Error',
        'User not found',
        backgroundColor: Get.theme.canvasColor.withOpacity(0.7),
        animationDuration: Duration(milliseconds: 600),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final moreSize = 50.0;
    return Scaffold(
      body: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned(
                    bottom: logoSize,
                    left: -moreSize / 2,
                    right: -moreSize / 2,
                    height: width + moreSize,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 1],
                              colors: deliveryGradient),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(width))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                        backgroundColor: Theme.of(context).canvasColor,
                        radius: logoSize,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/logo.png',
                            color: Theme.of(context).accentColor,
                          ),
                        )),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Log in",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor,
                                    )),
                        const SizedBox(height: 20),
                        Text("Username",
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Theme.of(context).accentColor)),
                        TextField(
                            controller: controller.usernameTextController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_outline,
                                    color: Theme.of(context).iconTheme.color),
                                hintText: 'Your username')),
                        const SizedBox(height: 20),
                        Text("Password",
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Theme.of(context).accentColor)),
                        TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: controller.passwordTextController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outlined,
                                  color: Theme.of(context).iconTheme.color),
                              hintText: 'Your password'),
                        ),
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(25),
                child: GradientButton(
                  text: 'Log in',
                  onTap: logIn,
                ))
          ]),
          Positioned.fill(child: Obx(
            () {
              if (controller.loginState.value == LoginState.loading) {
                return Container(
                  color: Colors.black26,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )),
        ],
      ),
    );
  }
}
