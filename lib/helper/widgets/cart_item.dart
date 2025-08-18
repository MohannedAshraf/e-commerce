import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      title: Text(
        cartItem.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(" ${cartItem.price}"),
      leading: Image.asset(
        cartItem.image,
        height: 70,
        width: 70,
        fit: BoxFit.cover,
      ),
      trailing: SizedBox(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //add or  remove button
            IconButton(
              onPressed: () {
                cartController.increaseQuantity(cartItem);
              },
              icon: const Icon(Icons.add),
            ),
            Text('${cartItem.quantity}'),
            IconButton(
              onPressed: () {
                cartController.decreaseQuantity(cartItem);
              },
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
