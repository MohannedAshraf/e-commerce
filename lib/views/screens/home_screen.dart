import 'package:e_commerce/controller/cart_controller.dart';
import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/helper/special_elevated.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<CartModel> _searchResults = [];

  void _onSearchChanged(String query, BuildContext context) {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }
    final cartController = context.read<CartController>();
    setState(() {
      _searchResults = cartController.searchProducts(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = CartModel.getFakeProducts();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final itemWidth = (screenWidth / 2) - 20;
    final itemHeight = screenHeight * 0.3;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/nav/1');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
        centerTitle: true,
        title: const Text(
          "ShopSmart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              onChanged: (value) => _onSearchChanged(value, context),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.second,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            /// ✅ Search results
            if (_searchResults.isNotEmpty)
              Container(
                constraints: const BoxConstraints(maxHeight: 150),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final product = _searchResults[index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text("\$${product.price}"),
                      onTap: () {
                        context.push('/product/${product.id}');
                      },
                    );
                  },
                ),
              ),

            const SizedBox(height: 10),
            Row(
              children: const [
                SpecialElevated(title: "All"),
                SpecialElevated(title: "Featured"),
                SpecialElevated(title: "New"),
              ],
            ),
            const SizedBox(height: 10),

            //  GridView
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.60,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final cartController = context.watch<CartController>();

                  final isInCart = cartController.cartItems.any(
                    (item) => item.id == product.id,
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              context.push('/product/${product.id}');
                            },
                            child: Image.asset(
                              product.image,
                              width: itemWidth,
                              height: itemHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(
                                isInCart
                                    ? Icons.shopping_cart
                                    : Icons.shopping_cart_outlined,
                                color: AppColors.third,
                              ),
                              onPressed: () {
                                if (isInCart) {
                                  context
                                      .read<CartController>()
                                      .removeItemFromCart(product);
                                } else {
                                  context.read<CartController>().addItemToCart(
                                    product,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.prim,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.second,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
