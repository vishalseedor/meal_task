import 'package:demo_task/productmodel.dart';
import 'package:demo_task/randommealscreen.dart';
import 'package:flutter/material.dart';

import 'mealprovider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Meal App',
      color: Colors.amber,
      home: RandomMealScreen(),
    );
  }
}
