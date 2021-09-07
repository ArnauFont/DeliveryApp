import 'package:delivery_app2/theming_and_state_management/domain/model/products.dart';

class ProductCart {
  final Product product;
  int quantity;

  ProductCart({
    required this.product,
    this.quantity = 1,
  });
}
