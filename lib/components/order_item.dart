import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/food.dart';

class OrderItem extends StatelessWidget {
  final String imagePath;
  final Food food;
  final Function()? add;
  final Function()? cut;
  final int count;

  OrderItem(
      {super.key,
      required this.imagePath,
      required this.add,
      required this.cut,
      required this.food,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 50),
        //margin: EdgeInsets.symmetric(horizontal: ),
        decoration: BoxDecoration(
          color: const Color(0xFFf5f5f5),
          borderRadius: BorderRadius.circular(35.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20, right: 30, left: 20),
                  child: Image.asset(
                    imagePath,
                    height: 80,
                    width: 80,
                  ),
                ),
                Flexible(
                  child: Container(
                      //height: 120,
                      width: 150,
                      padding: EdgeInsets.only(bottom: 20, right: 20, left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(food.name),
                          SizedBox(height: 10),
                          Text('${food.price.toString()} Euro'),
                        ],
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                      onPressed: add,
                      child: Icon(
                        size: 35,
                        CupertinoIcons.add,
                        color: Colors.black,
                      )),
                  Text(count.toString()),
                  CupertinoButton(
                      onPressed: cut,
                      child: Icon(
                        size: 35,
                        CupertinoIcons.minus,
                        color: Colors.black,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
