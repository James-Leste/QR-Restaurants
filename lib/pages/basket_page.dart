import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  BasketPage({super.key});

  final String restaurantName = "Sunny Restaurant";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Menu: $restaurantName',
            style: TextStyle(fontSize: 20),
          ),
        ),
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        )));
  }
}
