import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  final IconData icon;
  NotificationCard({super.key, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Icon(Icons.error),
      content: Text(
        message,
        style: TextStyle(fontSize: 24),
      ),
      insetAnimationDuration: const Duration(seconds: 1),
    );
  }
}
