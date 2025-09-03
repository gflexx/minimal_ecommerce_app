import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/item.dart';

class ProductViewPage extends StatelessWidget {
  final Item item;
  const ProductViewPage({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(item.imageUrl, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
