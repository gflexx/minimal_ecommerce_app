import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // profile info
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/1681073508132.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.green,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.edit, size: 16, color: Colors.white),
                        onPressed: () {
                          // TODO: Add edit functionality
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tupak Shakur',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 9),
            Text(
              'tupac@shakur.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 27, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.shopping_bag),
                    title: const Text('My Orders'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 10),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Shipping Addresses'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 10),
                  ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: const Text('Payment Methods'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 10),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {},
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
