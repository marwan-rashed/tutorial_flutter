import 'package:flutter/material.dart';
import 'cart.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Cart()),
            );
          },
          child: const Text('Go to cart!'),
        ),
      ),
    );
  }
}
