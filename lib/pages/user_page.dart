import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/list_card.dart';
import 'package:flutter_test_project/pages/personal/order_history.dart';
import 'package:flutter_test_project/pages/personal/userInfo_page.dart';

class UserPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Personal'),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCard(
                  text: 'User Profile',
                  icon: Icons.arrow_forward,
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => UserinfoPage()))),

              CustomCard(
                  text: 'Order History',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => OrderHistory()));
                  }),
              CustomCard(
                  text: 'Favorites',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    print('object');
                  }),
              CustomCard(
                  text: 'Payment Methods',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    print('object');
                  }),

              //     // ShoppingItem(
              //     //   name: 'name',
              //     //   price: 123,
              //     //   imageUrl: 'lib/images/cutlery.png',
              //     //   description: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
              //     // )
            ],
            // ),
          ),
        ));
  }
}
