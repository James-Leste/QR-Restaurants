import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/stock_item.dart';

class StockListPage extends StatelessWidget {
  StockListPage({super.key});

  final list = List<String>.generate(10, (i) => 'Item $i');

  void signout() async {
    await FirebaseAuth.instance.signOut();
  }

  void onTap() {
    print('clicked');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Menu",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(onPressed: signout, icon: Icon(Icons.logout)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Center(
                          child: StockItem(
                              imagePath: 'lib/images/google.png',
                              onTap: onTap)),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
