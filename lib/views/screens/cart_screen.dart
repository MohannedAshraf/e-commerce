// ignore_for_file: collection_methods_unrelated_type

import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/helper/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        if (cartController.cartItems.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Cart",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'There is no Item in Cart, Please Discover and return here after adding items',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text("Cart")),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartController.cartItems[index];
                      return CartItemWidget(cartItem: cartItem);
                    },
                  ),
                ),

                //total price
                ListTile(
                  title: const Text('Subtotal'),
                  trailing: Text(
                    '\$${cartController.subtotal.toStringAsFixed(2)}',
                  ),
                ),
                ListTile(
                  title: const Text('Delivery Fee'),
                  trailing: Text(
                    '\$${cartController.deliveryFee.toStringAsFixed(2)}',
                  ),
                ),
                ListTile(
                  title: const Text('Tax'),
                  trailing: Text('\$${cartController.tax.toStringAsFixed(2)}'),
                ),
                ListTile(
                  title: const Text('Total'),
                  trailing: Text(
                    '\$${cartController.total.toStringAsFixed(2)}',
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: double.infinity,
                  height: 48,
                  child: TextButton(
                    onPressed: () {
                      // clear cart
                      Provider.of<CartController>(
                        context,
                        listen: false,
                      ).clearCart();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.third,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
