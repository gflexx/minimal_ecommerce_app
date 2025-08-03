import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/cart_item.dart';
import 'package:minimal_ecommerce_app/models/cart.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            // heading
            Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            SizedBox(height: 27),

            Expanded(
              child: cart.getCartItems().isEmpty
                  ? Center(child: Text('Your cart is empty'))
                  : Column(
                      children: [
                        // cart items
                        Expanded(
                          child: ListView.builder(
                            itemCount: cart.getCartItems().length,
                            itemBuilder: (context, index) {
                              Item item = cart.getCartItems()[index];
                              return CartItem(item: item);
                            },
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // total price
                              Text(
                                'Total: ${cart.getCartItems().fold(0.0, (total, item) => total + item.price).toStringAsFixed(2)} Ksh.',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              // checkout button
                              GestureDetector(
                                onTap: (){
                                  debugPrint('To checkout page');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top:12),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.green
                                  ),
                                  child: Text(
                                    'Checkout',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
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
            ),
          ],
        ),
      ),
    );
  }
}
