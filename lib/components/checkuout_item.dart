import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:minimal_ecommerce_app/pages/product_view_page.dart';

class CheckuoutItem extends StatefulWidget {
  final Item item;

  const CheckuoutItem({super.key, required this.item});

  @override
  State<CheckuoutItem> createState() => _CheckuoutItemState();
}

class _CheckuoutItemState extends State<CheckuoutItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(9),
      ),
      margin: EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ProductViewPage(item: widget.item), // pass full item
              ),
            );
          },
          //  cart item image
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(6.3),
            child: Image.asset(widget.item.imageUrl),
          ),

          // cart item name
          title: Text(
            widget.item.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          // cart item price
          subtitle: Text('${widget.item.price.toStringAsFixed(2)} Ksh.'),
        ),
      ),
    );
  }
}
