import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: CupertinoTextField(
          textAlign: TextAlign.center,
          controller: controller,
          obscureText: obscureText,
          placeholder: hintText,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),

          // decoration: InputDecoration(
          //   enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: Colors.white),
          //       borderRadius: BorderRadius.circular(10)),
          //   focusedBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: Colors.grey.shade700),
          //       borderRadius: BorderRadius.circular(10)),
          //   fillColor: Colors.grey.shade200,
          //   filled: true,
          //   hintText: hintText,
          //   hintStyle: TextStyle(color: Colors.grey.shade500),
          // )),
        ));
  }
}
