import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/order_model.dart';

class OrderRepository extends ChangeNotifier {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  final String _collection = 'orders';

  Future<List<OrderModel>> fetchOrdersByUserId(String? userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
          .collection(_collection)
          .where('userId', isEqualTo: userId)
          .get();

      List<OrderModel> orders = querySnapshot.docs
          .map((doc) => OrderModel.fromFirestore(doc, null))
          .toList();

      // Sorting by order time
      orders.sort((a, b) => b.orderTime!.microsecondsSinceEpoch
          .compareTo(a.orderTime!.microsecondsSinceEpoch));

      return orders;
    } catch (e) {
      // Handle any errors
      throw Exception('Error fetching orders: $e');
    }
  }

  // Add a new order
  Future<void> addOrder(OrderModel order) async {
    try {
      await _db.collection(_collection).add(order.toFirestore());
      notifyListeners();
    } catch (e) {
      // Handle any errors
      throw Exception('Error adding order: $e');
    }
  }

  Future<void> deleteOrderById(String id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
          .collection(_collection)
          .where('orderId', isEqualTo: id)
          .get();
      if (querySnapshot.docs.length != 1) {
        return;
      }
      final String docId = querySnapshot.docs.first.id;
      log(docId);
      await _db.collection(_collection).doc(docId).delete();
      notifyListeners();
    } catch (e) {
      throw Exception('Error deleting order: $e');
    }
  }
}
