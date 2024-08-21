import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockItem extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const StockItem({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 50),
        //margin: EdgeInsets.symmetric(horizontal: ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.grey.shade100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Image.asset(
                imagePath,
                height: 200,
                width: 200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                    onPressed: onTap,
                    child: Icon(
                      size: 35,
                      CupertinoIcons.add,
                      color: Colors.black,
                    )),
                CupertinoButton(
                    onPressed: onTap,
                    child: Icon(
                      size: 35,
                      CupertinoIcons.minus,
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
