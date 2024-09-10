import 'package:flutter/cupertino.dart';
import 'package:flutter_test_project/models/order_model.dart';
import 'package:flutter_test_project/repositories/order_repository.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({super.key, required this.order});
  final OrderModel order;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final OrderRepository orderRepository = OrderRepository();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.order.orderId!,
          style: TextStyle(fontSize: 18),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  padding: EdgeInsets.all(25),
                  //crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('Items: ${widget.order.items.toString()}'),
                    SizedBox(height: 16),
                    Text(
                        'Order time: ${widget.order.orderTime!.toDate().toString()}'),
                    SizedBox(height: 16),
                    Text('User ID: ${widget.order.userId}')
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton.filled(
                      onPressed: () async {
                        await orderRepository
                            .deleteOrderById(widget.order.orderId!);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
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
