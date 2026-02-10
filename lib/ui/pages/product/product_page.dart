import 'package:flutter/material.dart';
import 'package:kopiness/core/theme/app_colors.dart';
import './widgets/product_cart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Product'),
        actions: [
          OutlinedButton(onPressed: () {}, child: const Text('Add Product')),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.45, // 🧠 match ProductCart
          ),
          itemBuilder: (context, index) {
            return const ProductCart();
          },
        ),
      ),
    );
  }
}
