import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/cart.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:provider/provider.dart';

class ProductViewPage extends StatefulWidget {
  final Item item;
  const ProductViewPage({super.key, required this.item});

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
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
    return Consumer(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(widget.item.imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // name and price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '${widget.item.price} Kshs.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // category
                    Text(
                      widget.item.categoryName,
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 40),
                    // description
                    Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 20),

                    Text(widget.item.description),

                    SizedBox(height: 40),

                    GestureDetector(
                      onTap: () => addItemToCart(widget.item),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            SizedBox(width: 9),
                            Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
