import 'package:delivery_app2/theming_and_state_management/presentation/splash/splash_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  final splashController = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: deliveryGradient)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: DeliveryColors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/logo.png',
                  color: DeliveryColors.purple,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Delivery App",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold, color: DeliveryColors.white),
            )
          ],
        ),
      ),
    );
  }
}
