import 'package:flutter/material.dart';
import 'package:kopiness/ui/molecules/bottom_navbar.dart';
import 'package:kopiness/ui/pages/product/product_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final Pages = const [
    Center(child: Text('Kasir')),
    Center(child: ProductPage()),
    Center(child: Text('Home Page')),
    Center(child: Text('History')),
    Center(child: Text('Kalkulator Brew')),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Pages[_index],
      bottomNavigationBar: BottomNavbar(
        currentIndex: _index,
        onChange: (i) => setState(() => _index = i),
      ),
    );
  }
}
