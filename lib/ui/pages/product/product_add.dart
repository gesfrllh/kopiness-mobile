import 'package:flutter/material.dart';
import 'package:kopiness/ui/atoms/app_button.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'Save Product',
              onPressed: () {
                final name = nameController.text;
                final price = priceController.text;

                // TODO: simpan product ke backend / state
                print('Save Product: $name - $price');

                Navigator.pop(context); // balik ke ProductPage
              },
            ),
          ],
        ),
      ),
    );
  }
}
