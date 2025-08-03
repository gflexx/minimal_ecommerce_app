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
  void navigateBottom(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottom(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo
            Column(
              children: [
                DrawerHeader(child: Image.asset('images/logo_img.png')),
                SizedBox(height: 18),

                // home and cart options
                Padding(
                  padding: const EdgeInsets.only(left: 27.0),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: (){
                      Navigator.pop(context);
                      navigateBottom(0);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27.0),
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag_rounded),
                    title: Text('Cart'),
                    onTap: (){
                      Navigator.pop(context);
                      navigateBottom(1);
                    },
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 27.0, bottom: 36),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIdx],
    );
  }
}
