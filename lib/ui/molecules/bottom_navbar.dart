import 'package:flutter/material.dart';
import 'package:kopiness/ui/atoms/nav_item.dart';
import 'package:kopiness/ui/components/navigation/bottom_nav_item.dart';

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChange;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    const navItems = [
      BottomNavItem(icon: Icons.point_of_sale, label: 'Cashier'),
      BottomNavItem(icon: Icons.inventory, label: 'Produk'),
      BottomNavItem(icon: Icons.home, label: 'Home'),
      BottomNavItem(icon: Icons.receipt_long, label: 'History'),
      BottomNavItem(icon: Icons.coffee_maker, label: 'Brew'),
    ];
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10),
        ],
      ),
      child: Row(
        children: navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return Expanded(
            child: NavItem(
              icon: item.icon,
              label: item.label,
              active: currentIndex == index,
              onTap: () => onChange(index),
            ),
          );
        }).toList(),
      ),
    );
  }
}
