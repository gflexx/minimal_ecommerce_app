import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/item_tile.dart';
import 'package:minimal_ecommerce_app/models/cart.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //  add item to cart
  void addItemToCart(Item item){
    debugPrint('happen?');
    Provider.of<Cart>(context, listen: false).addToCart(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to cart!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(
          children: [
            // search bar
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 27),
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

            // home message
            Padding(
              padding: EdgeInsets.symmetric(vertical: 27),
              child: Text(
                'Delivered right to your door step, Choose from a wide variety of fruits, veges, cereals, nuts..',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  // fontWeight: FontWeight.bold
                  fontSize: 16,
                ),
              ),
            ),

            // hot picks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Picks',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // item list, horizontal list view
            SizedBox(
              height: 390,
              child: ListView.builder(
                itemCount: value.getItemsForSale().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Item item = value.getItemsForSale()[index];
                  return ItemTile(
                    item: item,
                    onTap: () => addItemToCart(item),
                  );
                },
              ),
            ),

            SizedBox(height: 36),

            // recently added section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Added',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // item list, horizontal list view
            SizedBox(
              height: 390,
              child: ListView.builder(
                itemCount: value.getItemsForSale().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final reversedList = value.getItemsForSale().reversed.toList();
                  final item = reversedList[index];
                  return ItemTile(
                    item: item,
                    onTap: () => addItemToCart(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
