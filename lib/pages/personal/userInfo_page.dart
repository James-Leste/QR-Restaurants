import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/user_repository.dart';
import 'package:provider/provider.dart';

class UserinfoPage extends StatelessWidget {
  final String userName = "John";
  final String userEmail = "john.doe@example.com";
  final String userPhone = "+1 234 567 890";
  final String userAddress = "123 Main St, Springfield, USA";
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(
      builder: (context, UserRepository user, build) => CupertinoPageScaffold(
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
                subtitle: user.displayName!,
              ),
              _buildUserInfoTile(
                icon: CupertinoIcons.mail,
                title: "Email",
                subtitle: user.email!,
              ),
              _buildUserInfoTile(
                icon: CupertinoIcons.phone,
                title: "Phone",
                subtitle: user.phone!,
              ),
              _buildUserInfoTile(
                icon: CupertinoIcons.location,
                title: "Photo URL",
                subtitle: user.photoUrl!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoTile(
      {required IconData icon,
      required String title,
      required String subtitle,
      Function? onTap}) {
    return Card(
      color: CupertinoColors.systemGrey6,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          leading: Icon(icon, color: CupertinoColors.activeBlue),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          trailing: Icon(CupertinoIcons.forward),
        ),
      ),
    );
  }
}
