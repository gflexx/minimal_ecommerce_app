import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/product_list_item.dart';
import 'package:minimal_ecommerce_app/models/cart.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  // open filter dialog
  void openFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter Products'),
          content: Text('Filter options will go here.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () => openFilterDialog(),
          child: Icon(Icons.filter_list),
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              // search bar
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 27, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search'),
                    Icon(Icons.search, color: Colors.grey),
                  ],
                ),
              ),
          
              // product list
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 768 ? 3 : 2;
          
                  return GridView.builder(
                    itemCount: cart.getItemsForSale().length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(9),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.9,
                      mainAxisExtent: 330,
                      // mainAxisSpacing: 8,
                      crossAxisSpacing: 9,
                    ),
                    itemBuilder: (context, index) {
                      Item item = cart.getItemsForSale()[index];
                      return ProductListItem(item: item);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
