import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/pages/stock_list_page.dart';

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
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              label: 'Stock', icon: Icon(CupertinoIcons.list_bullet)),
          BottomNavigationBarItem(
              label: 'Personal', icon: Icon(CupertinoIcons.person)),
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(CupertinoIcons.home))
        ]),

        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (contenxt) => StockListPage());
            case 1:
              return Center(child: Text('Logged In as: ${user.email!}'));
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
