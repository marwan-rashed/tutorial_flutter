// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final List products;
  Cart(this.products, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return FractionallySizedBox(
                          widthFactor: 1,
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.blue, width: 1.0))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(products[index]['name'].toString()),
                                Text(products[index]['price'].toString() +
                                    r' $'),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first route when tapped.
                    print(products);
                    Navigator.pop(context);
                  },
                  child: const Text('Continue Shopping'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Checkout'),
                )
              ],
            ),
          ),
        ));
  }
}
