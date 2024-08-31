import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/shop_item.dart';

import 'package:flutter_test_project/models/food.dart';

import 'package:flutter_test_project/models/order_model.dart';

import 'package:flutter_test_project/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class StockListPage extends StatelessWidget {
  StockListPage({super.key});

  final restaurant =
      RestaurantModel(name: 'Sunny Restaurant', location: "Otaniemi");

  final String restaurantName = "Sunny Restaurant";

  @override
  Widget build(BuildContext context) {
    void addToOrder(String id, OrderModel order) {
      order.addItemToOrder(id);
      print(order.items);
    }

    void removeItem(String id, OrderModel order) {
      order.removeItemFromOrder(id);
      print(order.items);
    }

    return Consumer<OrderModel>(
      builder: (context, order, child) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              'Menu: $restaurantName',
              style: TextStyle(fontSize: 20),
            ),
          ),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: restaurant.menu.length,
                        itemBuilder: (context, index) {
                          Food item = restaurant.menu.elementAt(index);
                          return ListTile(
                            title: Center(
                              child: ShoppingItem(
                                  food: item,
                                  add: () {
                                    String foodId =
                                        restaurant.menu.elementAt(index).id;
                                    print('add one $foodId ');
                                    addToOrder(foodId, order);
                                  },
                                  cut: () {
                                    String foodId =
                                        restaurant.menu.elementAt(index).id;
                                    print('remove one $foodId ');
                                    removeItem(foodId, order);
                                  },
                                  count: order.items.isEmpty
                                      ? 0
                                      : order.getQuantityById(
                                          restaurant.menu.elementAt(index).id)),
                              // child: StockItem(
                              //     imagePath: 'lib/images/cutlery.png',
                              //     food: restaurant.menu.elementAt(index),
                              //     add: () {
                              //       String foodId =
                              //           restaurant.menu.elementAt(index).id;
                              //       print('add one $foodId ');
                              //       addToOrder(foodId, order);
                              //     },
                              //     cut: () {
                              //       String foodId =
                              //           restaurant.menu.elementAt(index).id;
                              //       print('remove one $foodId ');
                              //       removeItem(foodId, order);
                              //     },
                              //     count: order.items.isEmpty
                              //         ? 0
                              //         : order.getQuantityById(
                              //             restaurant.menu.elementAt(index).id)
                              //    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
