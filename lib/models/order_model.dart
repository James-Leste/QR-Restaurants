import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/food.dart';
import 'package:flutter_test_project/models/restaurant_model.dart';

class OrderModel extends ChangeNotifier {
  RestaurantModel _restaurantModel =
      RestaurantModel(name: 'Sunny Restaurant', location: "Otaniemi");

  List<OrderItemModel> items;
  DateTime? orderTime;
  String? userId;
  String? orderId;
  double? totalPrice;

  RestaurantModel get restaurant => _restaurantModel;

  OrderModel.newOrder()
      : items = [],
        totalPrice = 0;

  OrderModel(
      {required this.items,
      this.orderTime,
      this.userId,
      this.orderId,
      this.totalPrice});

  factory OrderModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return OrderModel(
      userId: data?['userId'],
      orderId: data?['orderId'],
      orderTime: data?['orderTime'],
      totalPrice: data?['totalPrice'],
      items: (data?['items'] as List<dynamic>)
          .map((item) =>
              OrderItemModel.fromFirestore(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'orderId': orderId,
      'orderTime': orderTime,
      'totalPrice': totalPrice,
      'items': items.map((item) => item.toFirestore()).toList(),
    };
  }

  set catalog(RestaurantModel newRestaurant) {
    _restaurantModel = newRestaurant;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  // get a list of itemIds
  List<String> get itemIds => items.map((item) => item.food.id).toList();

  // Adding an item to the order by its ID
  void addItemToOrder(String foodId) {
    if (itemIds.contains(foodId)) {
      //get the existing orderItem and increment quantity
      items.firstWhereOrNull((item) => item.food.id == foodId)?.quantity++;
    } else {
      //add a new item in the itemList
      Food newFood = restaurant.menu.firstWhere((item) => item.id == foodId);
      items.add(OrderItemModel(food: newFood));
    }
    notifyListeners();
  }

  // Removing an item from the order by its ID
  void removeItemFromOrder(String foodId) {
    if (itemIds.contains(foodId)) {
      OrderItemModel existItem =
          items.firstWhere((item) => item.food.id == foodId);
      //get the existing orderItem and increment quantity
      existItem.quantity--;
      if (existItem.quantity == 0) {
        items.remove(existItem);
      }
      notifyListeners();
    } else {
      print('no such food found in cart');
    }
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  // get total item number
  int get itemNumber =>
      items.map((item) => item.quantity).toList().reduce((x, y) => x + y);

  // get item count by the itemId
  int getQuantityById(String id) {
    if (!itemIds.contains(id)) {
      return 0;
    } else {
      return items.firstWhere((item) => item.food.id == id).quantity;
    }
  }

  // get the total price of the order
  double get total => items.isEmpty
      ? 0
      : items
          .map((item) => item.food.price * item.quantity)
          .toList()
          .reduce((x, y) => x + y);
}

class OrderItemModel {
  final Food food;
  int quantity;

  OrderItemModel({required this.food, this.quantity = 1});

  factory OrderItemModel.fromFirestore(Map<String, dynamic> data) {
    return OrderItemModel(
      food: Food.fromFirestore(data['food']),
      quantity: data['quantity'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'food': food.toFirestore(),
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return food.name + quantity.toString();
  }
}
