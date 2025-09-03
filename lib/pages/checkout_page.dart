import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/checkuout_item.dart';
import 'package:minimal_ecommerce_app/models/cart.dart';
import 'package:minimal_ecommerce_app/models/item.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Checkout'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap:
                      true, // 👈 let ListView take only the space it needs
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cart.getCartItems().length,

                  itemBuilder: (context, index) {
                    Item item = cart.getCartItems()[index];
                    return CheckuoutItem(item: item);
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Payment',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.credit_card),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Pay with PayStack',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // sub total
                    Text('Sub Total', style: TextStyle(fontSize: 16)),
                    Text(
                      '${cart.getCartItems().fold(0.0, (total, item) => total + item.price).toStringAsFixed(2)} Ksh.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // delivery price
                    Text('Delivery', style: TextStyle(fontSize: 16)),
                    Text(
                      '${50.00.toStringAsFixed(2)} Ksh.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // total price
                    Text('Total', style: TextStyle(fontSize: 16)),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      (cart.getCartItems().fold(
                                    0.0,
                                    (total, item) => total + item.price,
                                  ) +
                                  50.00)
                              .toStringAsFixed(2) +
                          ' Ksh.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.green,
                    ),
                    child: Text(
                      'Paywith Paystack',
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
        ),
      ),
    );
  }
}
