class Product {
  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.image_url,
  });

  final String name;
  final String description;
  final double price;
  final String image_url;
}
