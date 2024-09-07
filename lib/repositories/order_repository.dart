import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/order_model.dart';
import 'package:flutter_test_project/repositories/user_repository.dart';

class OrderRepository extends ChangeNotifier {
  List<OrderModel>? _orders;
  FirebaseFirestore _store;
  UserRepository _userRepository = UserRepository.instance();

  OrderRepository.instance() : _store = FirebaseFirestore.instance;

  // Future<OrderModel> getOrders () async {
  //   try{
  //     _store.
  //   }
  // }
}
