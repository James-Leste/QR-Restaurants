import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_project/models/order_model.dart';

class OrderHistory extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;
  Future<List<OrderModel>> fetchOrders(String? userId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('orders').where('userId', isEqualTo: userId).get();
    //print(querySnapshot.docs[0].data());
    // Convert each document into an OrderModel object

    List<OrderModel> orders = querySnapshot.docs
        .map((doc) => OrderModel.fromFirestore(doc, null))
        .toList();
    orders.sort((a, b) => b.orderTime!.microsecondsSinceEpoch
        .compareTo(a.orderTime!.microsecondsSinceEpoch));

    return orders;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Purchase History'),
      ),
      child: SafeArea(
        child: FutureBuilder(
            future: fetchOrders(user?.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                //print(snapshot.data);

                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text("No orders found for user '${user?.uid}'"));
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
                                    builder: (context) => CupertinoPageScaffold(
                                          navigationBar: CupertinoNavigationBar(
                                            middle: Text(order.orderId!),
                                          ),
                                          child: SafeArea(
                                            child: ListView(
                                                padding: EdgeInsets.all(16),
                                                //crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Text(
                                                      'Items: ${order.items.toString()}'),
                                                  SizedBox(height: 16),
                                                  Text(
                                                      'Order time: ${order.orderTime!.toDate().toString()}'),
                                                  SizedBox(height: 16),
                                                  Text(
                                                      'User ID: ${order.userId}')
                                                ]),
                                          ),
                                        )));
                          });
                    });
              }
            }),
      ),
    );
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
