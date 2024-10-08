import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/shop_item.dart';
import 'package:flutter_test_project/models/food.dart';
import 'package:flutter_test_project/models/order_model.dart';
import 'package:flutter_test_project/repositories/order_repository.dart';

import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class BasketPage extends StatelessWidget {
  BasketPage({super.key});

  final orderRepository = OrderRepository();
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> saveOrder(OrderModel order) async {
    if (order.items.isEmpty) {
      throw Exception('Empty Basket!');
    }
    order.totalPrice = order.total;
    order.orderId = Uuid().v1();
    order.orderTime = Timestamp.now();
    order.userId = user.uid;
    await orderRepository.addOrder(order);
    order.clearCart();
    print(order.items);
  }

  final String restaurantName = "Sunny Restaurant";
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderModel>(builder: (context, order, child) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              'Order: $restaurantName',
              style: TextStyle(fontSize: 18),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Flexible(
                  flex: 9,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: order.items.length,
                      itemBuilder: (context, index) {
                        Food item = order.items.elementAt(index).food;
                        return ListTile(
                          title: Center(
                            child: ShoppingItem(
                                food: item,
                                add: () {
                                  String foodId = order.itemIds[index];
                                  print('add one $foodId ');
                                  order.addItemToOrder(foodId);
                                },
                                cut: () {
                                  String foodId = order.itemIds[index];
                                  print('remove one $foodId ');
                                  order.removeItemFromOrder(foodId);
                                },
                                count: order.items.isEmpty
                                    ? 0
                                    : order
                                        .getQuantityById(order.itemIds[index])
                                // context.watch<OrderModel>().basket.isEmpty
                                //     ? 0
                                //     : context.watch<OrderModel>().basket[
                                //         restaurant.foodList.elementAt(index).id]!,
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Price: ${order.total} Euro',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 30),
                        IconButton(
                            onPressed: () async {
                              try {
                                await saveOrder(order);
                              } catch (e) {
                                log(e.toString());
                                return;
                              }
                            },
                            icon: Icon(
                              size: 50,
                              Icons.shopping_cart_checkout,
                            ))
                      ],
                    )))
              ],
            ),
          ));
    });
  }
}
