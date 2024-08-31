import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserinfoPage extends StatelessWidget {
  final String userName = "John Doe";
  final String userEmail = "john.doe@example.com";
  final String userPhone = "+1 234 567 890";
  final String userAddress = "123 Main St, Springfield, USA";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('User Information'),
      ),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            _buildUserInfoTile(
              icon: CupertinoIcons.person,
              title: "Name",
              subtitle: userName,
            ),
            _buildUserInfoTile(
              icon: CupertinoIcons.mail,
              title: "Email",
              subtitle: userEmail,
            ),
            _buildUserInfoTile(
              icon: CupertinoIcons.phone,
              title: "Phone",
              subtitle: userPhone,
            ),
            _buildUserInfoTile(
              icon: CupertinoIcons.location,
              title: "Address",
              subtitle: userAddress,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoTile(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Card(
      color: CupertinoColors.systemGrey6,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: CupertinoColors.activeBlue),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(CupertinoIcons.forward),
      ),
    );
  }
}
