import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/models/food.dart';

class StockItem extends StatelessWidget {
  final String imagePath;
  final Food food;
  final Function()? add;
  final Function()? cut;
  final int count;

  StockItem(
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
            borderRadius: BorderRadius.circular(40),
            color: Colors.blue.shade100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: Image.asset(
                    imagePath,
                    height: 80,
                    width: 80,
                  ),
                ),
                Flexible(
                  child: Container(
                      height: 120,
                      padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(food.name),
                          Text(food.price.toString()),
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
