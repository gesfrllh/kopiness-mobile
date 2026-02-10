import 'package:flutter/material.dart';
import 'package:kopiness/ui/atoms/app_button.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 🔥 penting
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1, // ⬅️ bikin konsisten
              child: Image.network(
                'https://images.unsplash.com/photo-1511920170033-f8396924c348',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Testing',
            style: TextStyle(fontWeight: FontWeight.w700),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          const Text(
            'Rp 300.000,00',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 6),

          // ACTION ICON
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                icon: Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: null,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // BUTTON
          AppButton(label: 'Keranjang', onPressed: () {}),

          const SizedBox(height: 6),

          AppButton(
            label: 'Detail',
            onPressed: () {},
            variant: AppButtonVariant.outline,
            borderRadius: 12,
          ),
        ],
      ),
    );
  }
}
