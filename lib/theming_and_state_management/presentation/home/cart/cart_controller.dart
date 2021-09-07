import 'package:delivery_app2/theming_and_state_management/domain/model/product_cart.dart';
import 'package:delivery_app2/theming_and_state_management/domain/model/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<ProductCart> cartList = <ProductCart>[].obs;

  RxInt totalItems = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void add(Product product) {
    final temp = List<ProductCart>.from(cartList);
    bool found = false;
    for (ProductCart p in temp) {
      if (p.product.name == product.name) {
        p.quantity += 1;
        found = true;
        break;
      }
    }
    if (!found) {
      temp.add(ProductCart(product: product, quantity: 1));
    }
    cartList.value = List<ProductCart>.from(temp);
    calculateTotals(cartList);
  }

  void remove(ProductCart productCart) {
    if (productCart.quantity > 1) {
      productCart.quantity -= 1;
      cartList.value = List<ProductCart>.from(cartList);
      calculateTotals(cartList);
    } else {
      delete(productCart);
    }
  }

  void delete(ProductCart productCart) {
    cartList.remove(productCart);
    calculateTotals(cartList);
  }

  void calculateTotals(List<ProductCart> temp) {
    final total = temp.fold(
        0, (int previousValue, element) => element.quantity + previousValue);

    final price = temp.fold(
        0.0,
        (double previousValue, element) =>
            element.product.price * element.quantity + previousValue);
    totalItems(total);
    totalPrice(price);
  }
}
