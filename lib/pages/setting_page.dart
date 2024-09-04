import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/user_repository.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(
        builder: (build, UserRepository user, child) {
      return CupertinoPageScaffold(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[100]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 24),
                  ),
                  IconButton(icon: Icon(Icons.logout), onPressed: user.signOut),
                ],
              ),
            )
          ],
        ),
      ));
    });
  }
}
