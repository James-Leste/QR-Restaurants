import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            "Settings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text('data'),
              )
            ],
          ),
        ));
  }
}
