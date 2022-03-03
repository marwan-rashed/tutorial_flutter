// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_field, prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'catalog.dart';

/// StatefulWidget
///
/// Stateful widget means that the widget has a mutable state that can be changed during widget's lifetime
/// StatefulWidget consist of 2 classes :
///   1 - The main class that extend StatefulWidget class (in this case "Login")
///   2 -  Another Class (in this case "_LoginState") that extends State Class
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    /// Scaffold
    ///
    /// Scaffold is a built-in class in flutter provides many widgets (or APIs) that we can use
    /// Scaffold provides a framework to implement material design layout in the App.
    /// Scaffold will expand and occupy all available space
    return Scaffold(

        /// AppBar
        ///
        /// is a material design class shown as a horizontal bar at the top of the screen
        /// used with Scaffold by Scaffold.appBar property
        appBar: AppBar(
          title: const Text('Shopping Cart'),
        ),

        /// Scaffold.body
        ///
        /// is a property in Scaffold class that represent the main content of the scaffold
        /// Scaffold.body appear below the appBar

        /// Center
        ///
        /// is a basic widget in flutter that take one child and place it in the middle of the screen
        body: Center(
          /// Column
          ///
          /// A widget that take an array of widgets (children) and display them vertically
          /// Column widget doesn't support scrolling
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Padding Class
              ///
              /// Padding class in flutter used to add empty space around an object
              /// Padding has two properties (child and padding)
              Padding(
                padding: EdgeInsets.all(10),

                /// TextField Class
                ///
                /// TextField is an input element that allow user to enter text
                /// It has many props like decoration, onChanged, ..., etc
                child: TextField(
                  /// TextField.onChanged
                  ///
                  /// A TextField property that hold a function and execute it every time value changed
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email or Username',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),

                /// ElevatedButton
                ///
                /// ElevatedButton is a material design widget that allow user to interact with the app by pressing it
                child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    if (_username != '' && _password != '') {
                      setState(() {
                        _username = '';
                        _password = '';
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Catalog()),
                      );
                    } else {
                      /// showDialog
                      ///
                      /// a material design alert dialog, to inform user with some information
                      /// it consists of title, content and a list of actions
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Alert !'),
                          content: const Text('Missing required data !'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
