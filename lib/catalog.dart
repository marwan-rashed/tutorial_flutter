// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_final_fields, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'cart.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  // const Catalog({Key? key}) : super(key: key);

  static const products = [
    {'name': 'product 001', 'price': 10},
    {'name': 'product 002', 'price': 05},
    {'name': 'product 003', 'price': 30},
    {'name': 'product 004', 'price': 42},
    {'name': 'product 005', 'price': 56},
    {'name': 'product 006', 'price': 77},
    {'name': 'product 007', 'price': 18},
    {'name': 'product 008', 'price': 06},
    {'name': 'product 009', 'price': 11},
  ];

  List _selected = [];
  List _selectedState = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catalog'),
          automaticallyImplyLeading: false,
          actions: [
            /// IconButton
            ///
            /// A material design widgets consist of an icon printed on a widget that respond to touches
            /// IconButton acts as a Button
            ///
            /// Commonly used in AppBar.actions field
            ///
            /// Note : if onPressed callback assigned to null the button will disabled
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart(_selectedState)),
                )
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5),

          /// FractionallySizedBox
          ///
          /// A flutter widget that sizes its child to a fraction of total available space
          /// It takes one child and sizes it to a fraction of an available space according to widthFactor and heightFactor props
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

                        /// Row
                        ///
                        /// A widget that take an array of widgets (children) and display them horizontally
                        /// Row widget doesn't support scrolling
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(products[index]['name'].toString()),
                            Text(products[index]['price'].toString() + r' $'),
                            IconButton(
                              icon: Icon(_selected.contains(products[index])
                                  ? Icons.remove_shopping_cart_sharp
                                  : Icons.add_shopping_cart_sharp),
                              color: _selected.contains(products[index])
                                  ? Colors.red
                                  : Colors.green,
                              onPressed: () => {
                                if (_selected.contains(products[index]))
                                  {
                                    _selected.remove(products[index]),
                                    setState(() {
                                      _selectedState = _selected;
                                    }),
                                    print(_selected)
                                  }
                                else
                                  {
                                    _selected.add(products[index]),
                                    setState(() {
                                      _selectedState = _selected;
                                    }),
                                    print(_selected)
                                  }
                              },
                            ),
                          ],
                        ),
                      ));
                },
              )),
        ));
  }
}
