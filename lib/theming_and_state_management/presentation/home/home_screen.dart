import 'package:delivery_app2/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/cart/cart_screen.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/home_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/products/products_screen.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/profile/profile_screen.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Obx(() {
            return IndexedStack(
              index: controller.indexSelected.value,
              children: [
                ProductsScreen(),
                CartScreen(
                  goShopping: () {
                    controller.updateIndexSelected(0);
                  },
                ),
                ProfileScreen(),
              ],
            );
          }),
        ),
        Obx(
          () => _DeliveryNavBar(
              index: controller.indexSelected.value,
              onIndexSelected: (index) {
                controller.updateIndexSelected(index);
              }),
        ),
      ],
    ));
  }
}

class _DeliveryNavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  const _DeliveryNavBar(
      {Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final cartController = Get.find<CartController>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).bottomAppBarColor,
                  spreadRadius: 5,
                  blurRadius: 7,
                ),
              ],
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      onIndexSelected(0);
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: index == 0
                          ? DeliveryColors.purple
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Icon(
                            Icons.home,
                            color: index == 0
                                ? DeliveryColors.white
                                : Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          onIndexSelected(1);
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: index == 1
                              ? DeliveryColors.purple
                              : Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Icon(
                                Icons.shopping_basket_outlined,
                                color: index == 1
                                    ? DeliveryColors.white
                                    : Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Obx(
                          () => cartController.totalItems.value != 0
                              ? CircleAvatar(
                                  radius: 10,
                                  backgroundColor: DeliveryColors.pink,
                                  child: Text(cartController.totalItems.value
                                      .toString()),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                  Obx(() {
                    final user = controller.user.value;
                    if (user == null) {
                      return CircleAvatar(
                        radius: 23,
                        backgroundColor: index == 2
                            ? DeliveryColors.purple
                            : Colors.transparent,
                        child: IconButton(
                            icon: Icon(Icons.person_outlined,
                                color: index == 2
                                    ? DeliveryColors.white
                                    : Theme.of(context).accentColor),
                            onPressed: () => onIndexSelected(2)),
                      );
                    } else {
                      return InkWell(
                          onTap: () {
                            onIndexSelected(2);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundColor: index == 2
                                ? DeliveryColors.purple
                                : Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(user.image),
                              ),
                            ),
                          ));
                    }
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
