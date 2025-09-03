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
        appBar: AppBar(
          title: Text('Checkout'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
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
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      child: Icon(Icons.credit_card)),
                    SizedBox(width: 10,),
                    Text('Pay with PayStack', style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
