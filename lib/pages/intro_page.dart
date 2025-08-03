import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(27.0),
          child: Column(
            children: [
              // logo
              Image.asset('images/logo_img.png', height: 243),
              SizedBox(height: 36),

              // title
              Text(
                'Your Daily Source of Freshness',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 45),

              // subheading
              Text(
                'Fresh produce delivered to your doorstep.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 63),

              // start now btn
              Container(
                decoration: BoxDecoration(color: Colors.green),
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Shop Now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
