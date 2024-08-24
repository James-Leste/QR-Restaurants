import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/food.dart';
import 'package:flutter_test_project/models/restaurant_model.dart';

class OrderModel extends ChangeNotifier {
  RestaurantModel _restaurantModel = RestaurantModel();

  final List<OrderItemModel> items = [];

  RestaurantModel get restaurant => _restaurantModel;

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

  int get itemNumber =>
      items.map((item) => item.quantity).toList().reduce((x, y) => x + y);

  int getQuantityById(String id) {
    if (!itemIds.contains(id)) {
      return 0;
    } else {
      return items.firstWhere((item) => item.food.id == id).quantity;
    }
  }
}

class OrderItemModel {
  Food food;
  int quantity;

  //OrderItemModel getOrderItemById(String id) {}

  // int get itemNumber => quantity;

  // set addQuantity(int number) {
  //   quantity = quantity + number;
  // }

  OrderItemModel({required this.food, this.quantity = 1});

  @override
  String toString() {
    return food.name + quantity.toString();
  }
}
