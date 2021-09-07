import 'package:delivery_app2/theming_and_state_management/presentation/main_binding.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainThemingAndStateMagament extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('building app');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      //  If device has dark mode enabled, dark theme is forced (switch in profile screen won't change app's theme).
      initialRoute: DeliveryRoutes.splash,
      getPages: DeliveryPages.pages,
      initialBinding: MainBinding(),
    );
  }
}
