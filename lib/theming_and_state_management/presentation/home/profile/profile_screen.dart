import 'package:delivery_app2/theming_and_state_management/presentation/home/home_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/routes/delivery_navigation.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<HomeController>();

  Future<void> logOut() async {
    await controller.logOut();
    Get.changeTheme(darkTheme);
    Get.offAllNamed(DeliveryRoutes.login);
  }

  void onThemeUpdated(bool isDark) {
    print('changing theme to ' + isDark.toString());
    controller.changeTheme(isDark);
    Get.changeTheme(isDark ? darkTheme : lightTheme);
    print(Get.theme);
    // if (isDark) {
    //   Get.changeThemeMode(ThemeMode.dark);
    // } else {
    //   Get.changeThemeMode(ThemeMode.light);
    // }
    print(Get.theme);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final user = controller.user.value;
        return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: DeliveryColors.purple,
                          radius: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(user.image)),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.name,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Theme.of(context).canvasColor,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Profile Information',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'E-mail',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    user.username,
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Dark mode',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          useSafeArea: true,
                                          barrierDismissible: true,
                                          builder: (_) => AlertDialog(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .canvasColor,
                                                title: Text(
                                                  'Dark mode',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                content: Text(
                                                  'If your device has dark mode turned on, this switch will not change the theme of the app. It will always be dark theme.',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Theme.of(context)
                                                                .buttonColor,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Ok'))
                                                ],
                                              ));
                                    },
                                    child: Icon(Icons.help_outline,
                                        color: Theme.of(context).accentColor),
                                  ),
                                  Spacer(),
                                  Obx(
                                    () => Switch(
                                      value: controller.isDark.value,
                                      onChanged: onThemeUpdated,
                                      activeColor: DeliveryColors.purple,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: GradientButton(
                      onTap: () => logOut(),
                      text: 'Log out',
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
