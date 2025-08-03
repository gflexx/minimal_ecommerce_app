import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/bottom_nav_bar.dart';
import 'package:minimal_ecommerce_app/pages/cart_page.dart';
import 'package:minimal_ecommerce_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // selected index for bottom navigation
  int _selectedIdx = 0;

  // method to handle nav change 
  void navigateBottom(int index){
    setState(() {
      _selectedIdx = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottom(index),
      ),
      body: _pages[_selectedIdx],
    );
  }
}
