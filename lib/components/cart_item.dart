import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/cart.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:minimal_ecommerce_app/pages/product_view_page.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  final Item item;
  const CartItem({super.key, required this.item});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeFromCart(widget.item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.item.name} removed from cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(9),
      ),
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        //  cart item image
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6.3),
          child: Image.asset(widget.item.imageUrl),
        ),

        // cart item name
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ProductViewPage(item: widget.item), // pass full item
              ),
            );
          },
          child: Text(
            widget.item.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // cart item price
        subtitle: Text('${widget.item.price.toStringAsFixed(2)} Ksh.'),

        // cart item delete btn
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () => removeItemFromCart(),
        ),
      ),
    );
  }
}
