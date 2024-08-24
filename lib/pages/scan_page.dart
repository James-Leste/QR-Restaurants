import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Center(
          child: GestureDetector(
              onTap: () => print("open camera"),
              child: Image.asset(
                'lib/images/qr-code.gif',
                width: 300,
                height: 300,
              ))),
    ));
  }
}
