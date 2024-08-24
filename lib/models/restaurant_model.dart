import 'package:flutter_test_project/models/food.dart';

class RestaurantModel {
  String name = 'Sunny Restaurant';
  String location = 'Otaniemi, Espoo, 02150';
  String imagePath = 'lib/images/cutlery.png';
  List<Food> _menu = [
    Food(id: '001', name: 'dumpling', price: 25, imagePath: ''),
    Food(id: '002', name: 'sushi', price: 30, imagePath: ''),
    Food(id: '003', name: 'burger', price: 15, imagePath: ''),
    Food(id: '004', name: 'pizza', price: 22, imagePath: ''),
    Food(id: '005', name: 'pasta', price: 18, imagePath: ''),
    Food(id: '006', name: 'salad', price: 12, imagePath: ''),
    Food(id: '007', name: 'fried chicken', price: 20, imagePath: ''),
    Food(id: '008', name: 'taco', price: 10, imagePath: ''),
    Food(id: '009', name: 'steak', price: 35, imagePath: ''),
    Food(id: '010', name: 'ramen', price: 17, imagePath: ''),
    Food(id: '011', name: 'ice cream', price: 8, imagePath: ''),
  ];

  //RestaurantModel();
  // {required this.name,
  // required this.location,
  // required this.imagePath,
  // required this.foodList});

  List<Food> get menu => _menu;

  //Food getById(String id) => _menu.getB
}
