import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class cart extends StatelessWidget {
  static const routename= '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: const Text('Cart Page',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.deepPurple),

    );
  }
}
