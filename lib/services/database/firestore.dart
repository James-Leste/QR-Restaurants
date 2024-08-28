import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_project/models/food.dart';

class FireStoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');
  Future<void> placeOrder(Map<Food, int> list, String email) async {
    await orders.add({
      'foodList': list,
      'orderTime': Timestamp.now(),
      'email': email,
    });
  }
}
