import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoPageScaffold(
            child: DefaultTextStyle(
      style: TextStyle(fontSize: 25, color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email: ${user.email}',
          ),
          SizedBox(height: 20),
          Text('Displayed name: ${user.displayName}'),
          SizedBox(height: 20),
          Text('Verified? ${user.emailVerified}'),
          SizedBox(height: 20),
          Text('refreshToken: ${user.refreshToken}'),
          SizedBox(height: 20),
          Text('Displayed name: ${user.displayName}'),
          SizedBox(height: 20),
          Text('Displayed name: ${user.displayName}'),
          SizedBox(height: 20),
          Text('Displayed name: ${user.displayName}'),
          SizedBox(height: 20),
          Text('Displayed name: ${user.displayName}'),
        ],
      ),
    )));
  }
}
