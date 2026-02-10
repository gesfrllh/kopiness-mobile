import 'package:flutter/material.dart';
import 'package:kopiness/ui/atoms/app_button.dart';
// import 'package:kopiness/core/theme/app_colors.dart';
import './widgets/product_cart.dart';
import 'package:kopiness/ui/pages/product/product_add.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Product'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AppButton(
              label: 'Add Product',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddProductPage()),
                );
              },
              variant: AppButtonVariant.outline,
              isCompact: true, // ✅ penting
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.42, // 🧠 match ProductCart
          ),
          itemBuilder: (context, index) {
            return const ProductCart();
          },
        ),
      ),
    );
  }
}
