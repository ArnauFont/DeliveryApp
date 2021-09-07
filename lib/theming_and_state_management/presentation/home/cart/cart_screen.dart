import 'package:delivery_app2/theming_and_state_management/domain/model/product_cart.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/theme.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends GetWidget<CartController> {
  final VoidCallback goShopping;

  CartScreen({Key? key, required this.goShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping cart'),
          centerTitle: true,
        ),
        body: Obx(
          () {
            if (controller.totalItems.value == 0)
              return _EmptyCart(
                goShopping: goShopping,
              );
            else
              return _FullCart();
          },
        ));
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback goShopping;
  const _EmptyCart({Key? key, required this.goShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100,
          child: Image.asset(
            'assets/sad_face.png',
            color: DeliveryColors.green,
          ),
        ),
        Text(
          'Oh, wow! No products added yet',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(fontSize: 20),
                primary: DeliveryColors.purple,
              ),
              onPressed: goShopping,
              child: Text('Go shopping'),
            ),
          ],
        )
      ],
    );
  }
}

class _FullCart extends GetWidget<CartController> {
  const _FullCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
              child: Obx(
            () => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.cartList.length,
                itemExtent: 250,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  final product = controller.cartList[index];
                  return _ShoppingCartCard(
                    productCart: product,
                    onAdd: () {
                      controller.add(product.product);
                    },
                    onRemove: () {
                      controller.remove(product);
                    },
                    onDelete: () {
                      controller.delete(product);
                    },
                  );
                }),
          )),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Theme.of(context).canvasColor,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Sub total',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor)),
                              Obx(
                                () => Text(
                                    controller.totalPrice.value
                                            .toStringAsFixed(2) +
                                        ' €',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping costs',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
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
                                                Theme.of(context).canvasColor,
                                            title: Text(
                                              'Shipping costs',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: Text(
                                              'For purchases of 50 € or more, free shipping.',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .accentColor),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Theme.of(context)
                                                        .buttonColor,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
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
                                () => Text(
                                    controller.totalPrice.value > 49.99
                                        ? 'Free'
                                        : '5.0 €',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor)),
                              Obx(() {
                                final price =
                                    controller.totalPrice.value > 49.99
                                        ? controller.totalPrice.value
                                        : controller.totalPrice.value + 5.0;
                                return Text(price.toStringAsFixed(2) + ' €',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor));
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Spacer(),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GradientButton(text: 'Checkout', onTap: () {}),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShoppingCartCard extends StatelessWidget {
  final ProductCart productCart;
  final VoidCallback onAdd;
  final VoidCallback onDelete;
  final VoidCallback onRemove;
  const _ShoppingCartCard({
    Key? key,
    required this.productCart,
    required this.onAdd,
    required this.onDelete,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          productCart.product.image_url,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            productCart.product.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: onRemove,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(0),
                                  primary: DeliveryColors
                                      .lightGrey, // <-- Button color
                                  onPrimary: Colors.red, // <-- Splash color
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  productCart.quantity.toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: onAdd,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(0),
                                  primary:
                                      DeliveryColors.purple, // <-- Button color
                                  onPrimary: Colors.white, // <-- Splash color
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  '${productCart.product.price} €',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: ElevatedButton(
              onPressed: onDelete,
              child: Icon(Icons.delete_outline, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                primary: DeliveryColors.pink, // <-- Button color
                onPrimary: Colors.red, // <-- Splash color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
