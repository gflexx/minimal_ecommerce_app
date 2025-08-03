import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/item.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //  item image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item.imageUrl
            ),
          ),

          // name
          Text(item.name)
        ],
      ),
    );
  }
}