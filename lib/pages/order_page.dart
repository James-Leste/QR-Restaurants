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
    return Consumer<OrderModel>(builder: (context, order, child) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              'Menu: $restaurantName',
              style: TextStyle(fontSize: 20),
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
                        return ListTile(
                          title: Center(
                            child: StockItem(
                                imagePath: 'lib/images/cutlery.png',
                                food: order.items.elementAt(index).food,
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
                          'Price: ${order.totalPrice} Euro',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 30),
                        IconButton(
                            onPressed: () {},
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
