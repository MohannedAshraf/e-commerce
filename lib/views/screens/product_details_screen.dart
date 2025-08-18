import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.prim),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          //
          var product = cartController.getProductById(id);

          //
          product ??= CartModel.getFakeProducts().firstWhere(
            (p) => p.id == id,
            orElse: () => CartModel.getFakeProducts().first,
          );

          final isInCart = cartController.cartItems.any(
            (item) => item.id == product!.id,
          );

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.prim,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // price
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.second,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // الوصف
                      Text(
                        product.desc,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.prim,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Add to Cart
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.third,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (isInCart) {
                              cartController.removeItemFromCart(product!);
                            } else {
                              cartController.addItemToCart(product!);
                            }
                          },
                          child: Text(
                            isInCart ? "Remove from Cart" : "Add to Cart",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.background,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
