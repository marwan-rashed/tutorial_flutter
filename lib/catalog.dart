// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'cart.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  static const products = ['Product 001', 'Product 002', 'Product 003'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catalog'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                )
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: FractionallySizedBox(
              widthFactor: 1,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.blue, width: 1.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(products[index]),
                            IconButton(
                              icon: Icon(Icons.add_shopping_cart_sharp),
                              onPressed: () => {},
                            ),
                          ],
                        ),
                      ));
                },
              )),
        ));
  }
}
