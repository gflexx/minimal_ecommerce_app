import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/cart.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:minimal_ecommerce_app/pages/product_view_page.dart';
import 'package:provider/provider.dart';

class ProductListItem extends StatefulWidget {
  final Item item;
  const ProductListItem({super.key, required this.item});

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  // add items to cart
  void addItemToCart(Item item) {
    // check if in cart

    bool isInCart = Provider.of<Cart>(context, listen: false).isInCart(item);

    if (isInCart) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${item.name} is already in cart!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // go to product details page
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductViewPage(item: widget.item), // pass full item
                    ),
                  );
                },
                //  item image
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.item.imageUrl,
                    fit: BoxFit.cover,
                    height: 180,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
              ),

              //  item image
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // item name
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        widget.item.name,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    // item price
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        '${widget.item.price} Ksh.',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),

                    // add to cart btn
                    GestureDetector(
                      onTap: () => addItemToCart(widget.item),
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        padding: EdgeInsets.all(9),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.green,
                        ),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
