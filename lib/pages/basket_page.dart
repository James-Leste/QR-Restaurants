import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/components/stock_item.dart';
import 'package:flutter_test_project/models/order_model.dart';
import 'package:flutter_test_project/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  BasketPage({super.key});

  final restaurant = RestaurantModel();

  final String restaurantName = "Sunny Restaurant";
  @override
  Widget build(BuildContext context) {
    var order = context.read<OrderModel>();
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
                    itemCount: order.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Center(
                          child: StockItem(
                              imagePath: 'lib/images/cutlery.png',
                              food: order.items.elementAt(index).food,
                              add: () {
                                String foodId =
                                    restaurant.menu.elementAt(index).id;
                                print('add one $foodId ');
                                //addToOrder(foodId);
                              },
                              cut: () {
                                String foodId =
                                    restaurant.menu.elementAt(index).id;
                                print('remove one $foodId ');
                                //removeItem(foodId);
                              },
                              count: 0
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
            ],
          ),
        )));
  }
}
