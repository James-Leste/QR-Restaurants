import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    Theme(
      // Create a unique theme with `ThemeData`.
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
        ),
      ),
      child: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );

    return SafeArea(
        child: CupertinoPageScaffold(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email: ${user.email}',
        ),
        Text('xxx ${user.displayName}'),
        Text('Displayed name: ${user.displayName}'),
        Text('Displayed name: ${user.displayName}')
      ],
    )));
  }
}
