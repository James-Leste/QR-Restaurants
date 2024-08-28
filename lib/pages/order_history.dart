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

    return orders;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoPageScaffold(
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
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    var order = orders[index];
                    return DefaultTextStyle(
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.orderTime!.toDate().toString()),
                          Text(order.items.toString()),
                          Text(order.totalPrice.toString())
                        ],
                      ),
                    );
                  });
            }
          }),
      //         child: ListView(
      //   children: [
      //     DropListItem(
      //       title: 'Item 1',
      //       detail:
      //           'Detailed information for item 1. This content expands and collapses smoothly.',
      //     ),
      //     DropListItem(
      //       title: 'Item 2',
      //       detail:
      //           'Detailed information for item 2. Adjust the detail text to see the expansion effect.',
      //     ),
      //     DropListItem(
      //       title: 'Item 3',
      //       detail:
      //           'Detailed information for item 3. You can add more text here as needed.',
      //     ),
      //   ],
      // )
    ));
  }
}
