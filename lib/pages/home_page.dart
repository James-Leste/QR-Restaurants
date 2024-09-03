import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_test_project/pages/order_page.dart';
import 'package:flutter_test_project/pages/scan_page.dart';
import 'package:flutter_test_project/pages/setting_page.dart';
import 'package:flutter_test_project/pages/stock_list_page.dart';
import 'package:flutter_test_project/pages/user_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                label: 'Menu', icon: Icon(CupertinoIcons.list_bullet)),
            BottomNavigationBarItem(
                label: 'Personal', icon: Icon(CupertinoIcons.person)),
            BottomNavigationBarItem(
                label: 'Scan', icon: Icon(CupertinoIcons.qrcode)),
            BottomNavigationBarItem(
                label: 'My Basket', icon: Icon(CupertinoIcons.cart)),
            BottomNavigationBarItem(
                label: 'Settings', icon: Icon(CupertinoIcons.settings))
          ],
          height: 60,
        ),

        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (contenxt) => StockListPage());
            case 1:
              return CupertinoTabView(builder: (context) => UserPage());
            case 2:
              return CupertinoTabView(builder: (context) => ScanPage());
            case 3:
              return CupertinoTabView(builder: (context) => BasketPage());
            case 4:
              return CupertinoTabView(builder: (contenxt) => SettingPage());
            default:
              return Center(child: Text('no'));
          }
        },
        // navigationBar: CupertinoNavigationBar(
        //   trailing: IconButton(onPressed: signout, icon: Icon(Icons.logout)),
        // ),
        // child: Center(child: Text('Logged In as: ${user.email!}')),
      ),
    );
  }
}
