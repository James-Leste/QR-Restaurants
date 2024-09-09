import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/order_model.dart';
import 'package:flutter_test_project/repositories/order_repository.dart';

class OrderDetail extends StatelessWidget {
  OrderDetail({super.key, required this.order});
  final OrderModel order;
  final OrderRepository orderRepository = OrderRepository();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(order.orderId!),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  padding: EdgeInsets.all(25),
                  //crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('Items: ${order.items.toString()}'),
                    SizedBox(height: 16),
                    Text('Order time: ${order.orderTime!.toDate().toString()}'),
                    SizedBox(height: 16),
                    Text('User ID: ${order.userId}')
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton.filled(
                      onPressed: () async {
                        Navigator.pop(context);
                        await orderRepository.deleteOrderById(order.orderId!);
                      },
                      child: Text('delete')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
