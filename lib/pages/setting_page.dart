import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/services/auth/auth_services.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _AuthService = AuthServices();
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
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: _AuthService.signOut,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
