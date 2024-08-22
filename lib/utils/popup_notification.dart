import 'package:flutter/cupertino.dart';

class Popupnotification {
  final BuildContext context;
  Popupnotification({required this.context});

  // failed messages
  void failedMessage(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Icon(CupertinoIcons.bell),
          content: Text(
            message,
            style: TextStyle(fontSize: 24),
          ),
        );
      },
      barrierDismissible: true,
    );
  }
}
