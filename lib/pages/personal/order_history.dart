import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/order_model.dart';
import 'package:flutter_test_project/pages/personal/order_detail.dart';
import 'package:flutter_test_project/repositories/order_repository.dart';
import 'package:flutter_test_project/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<OrderRepository, UserRepository>(builder: (context,
        OrderRepository orderRepository, UserRepository userRepository, child) {
      User? user = userRepository.user;
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Purchase History'),
        ),
        child: SafeArea(
          child: FutureBuilder(
              future: orderRepository.fetchOrdersByUserId(user?.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  //print(snapshot.data);

                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text(
                    "No orders found for user '${user?.email}'",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ));
                } else {
                  List<OrderModel> orders = snapshot.data!;
                  //return Text('data');
                  return ListView.builder(
                      padding: EdgeInsets.all(16.0),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        var order = orders[index];
                        return _buildUserOrderTile(
                            icon: Icons.list,
                            order: order,
                            action: () {
                              log('clicked');
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          OrderDetail(order: order)));
                            });
                      });
                }
              }),
        ),
      );
    });
  }

  Widget _buildUserOrderTile(
      {required Function action,
      required OrderModel order,
      required IconData icon}) {
    return Card(
      color: CupertinoColors.systemGrey6,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => action(),
        child: ListTile(
          leading: Icon(icon, color: CupertinoColors.activeBlue),
          title: Text(
            order.items.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            order.orderId.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Icon(CupertinoIcons.forward),
        ),
      ),
    );
  }
}
