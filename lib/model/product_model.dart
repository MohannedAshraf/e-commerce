import 'package:e_commerce/helper/app_images.dart';

class CartModel {
  final int id;
  final int quantity;
  final String title;
  final String desc;
  final String image;
  final double price;
  final bool isInCart;

  const CartModel({
    required this.id,
    required this.quantity,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
    this.isInCart = false,
  });

  CartModel copyWith({
    int? id,
    int? quantity,
    String? title,
    String? desc,
    String? image,
    double? price,
    bool? isInCart,
  }) {
    return CartModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      image: image ?? this.image,
      price: price ?? this.price,
      isInCart: isInCart ?? this.isInCart,
    );
  }

  // same at run
  static final List<CartModel> _products = _generateProducts();

  static List<CartModel> getFakeProducts() => _products;

  static List<CartModel> _generateProducts() {
    final List<CartModel> products = [];

    final List<String> productTitles = [
      "T-Shirt",
      "Jeans",
      "Jacket",
      "Sneakers",
      "Dress",
      "Hoodie",
      "Shorts",
      "Cap",
      "Sweater",
      "Skirt",
    ];

    final List<String> descriptions = [
      "Comfortable and stylish clothing for everyday wear.",
      "Made with premium fabric for durability and comfort.",
      "Trendy design that matches modern fashion styles.",
      "Perfect for casual and special occasions.",
      "Soft, breathable, and suitable for all seasons.",
    ];

    final List<String> images = [
      AppImages.shirt,
      AppImages.jeans,
      AppImages.sweatshirt,
      AppImages.shoes,
      AppImages.bag,
      AppImages.boat,
    ];

    for (int i = 0; i < 100; i++) {
      final int titleIndex = i % productTitles.length;
      final int descIndex = i % descriptions.length;
      final int imageIndex = i % images.length;

      final String title = "${productTitles[titleIndex]} ${i + 1}";
      final String desc = descriptions[descIndex];
      final String image = images[imageIndex];
      final double price = 50 + (i % 151).toDouble();

      products.add(
        CartModel(
          id: i + 1,
          quantity: 1,
          title: title,
          desc: desc,
          image: image,
          price: price,
          isInCart: false,
        ),
      );
    }

    return products;
  }
}
