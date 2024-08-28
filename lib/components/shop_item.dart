import 'package:flutter/material.dart';

class ShoppingItem extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final Function()? add;
  final Function()? cut;
  final int count;

  ShoppingItem(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.description,
      required this.add,
      required this.cut,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFf5f5f5),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Item Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.0),

          // Expanded Section with Name, Description, and Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),

                // Item Description (single line with ellipsis)
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 8.0),

                // Item Price
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Quantity Controls
          Row(
            children: [
              IconButton(
                onPressed: cut,
                icon: Icon(Icons.remove_circle_outline),
                color: Colors.black54,
                iconSize: 28.0,
              ),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                onPressed: add,
                icon: Icon(Icons.add_circle_outline),
                color: Colors.black54,
                iconSize: 28.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
