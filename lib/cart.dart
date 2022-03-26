// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'catalog.dart';

/// StatelessWidget
///
/// Stateless Widget is an immutable widget, that can't change during its life cycle
/// All variables are final in Stateless Widgets
///
/// Ex. : Text, Icon, etc ...
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
                /// Expanded
                ///
                /// A widget that expands a child of a row or column to fill all available space along the main axis
                ///
                /// If multiple children are expanded, the available space is divided among them
                Expanded(
                  /// ListView.builder
                  ///
                  /// A widget that creates a scrollable, linear array of widgets
                  ///
                  /// ListView constructor works well for small lists, but for lists with big number of elements we use ListView.builder
                  /// This constructor is more powerful because it creates layout only for items visible on screen and lazily build other items when user scrolls
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
                  onPressed: () {
                    int total = 0;

                    products.forEach((element) {
                      total += int.parse(element['price'].toString());
                    });

                    print(total);
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alert !'),
                        content: Text('Total amount is $total \$'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Catalog()),
                              )
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Checkout'),
                )
              ],
            ),
          ),
        ));
  }
}
