import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/item_tile.dart';
import 'package:minimal_ecommerce_app/models/item.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                'Hot Picks',
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

        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemTile(
                item: Item(
                  name: 'One',
                  description: 'Descri',
                  price: 20,
                  imageUrl: 'images/cereals.png',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
