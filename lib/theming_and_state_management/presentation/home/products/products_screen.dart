import 'package:delivery_app2/theming_and_state_management/domain/model/products.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/cart/cart_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/home/products/products_controller.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/theme.dart';
import 'package:delivery_app2/theming_and_state_management/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key}) : super(key: key);

  final controller = Get.put<ProductsController>(ProductsController(
    apiRepository: Get.find(),
  ));

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.productsList.isNotEmpty
            ? GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: controller.productsList.length,
                itemBuilder: (context, index) {
                  final product = controller.productsList[index];
                  return _ItemProduct(
                    product: product,
                    onTap: () {
                      cartController.add(product);
                    },
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                ),
              ),
      ),
    );
  }
}

class _ItemProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const _ItemProduct({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Theme.of(context).canvasColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Theme.of(context).splashColor,
        onTap: () {
          print('Card tapped.');
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      product.image_url,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Flexible(
                        child: Text(
                          product.description,
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                color: DeliveryColors.lightGrey,
                              ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${product.price} €',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
              GradientButton(
                  text: 'Buy',
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                  onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
