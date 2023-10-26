import 'package:flutter/material.dart';

class DemoMealScreen extends StatefulWidget {
  const DemoMealScreen({super.key});

  @override
  State<DemoMealScreen> createState() => _DemoMealScreenState();
}

class _DemoMealScreenState extends State<DemoMealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Demo Meal Screen',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('One'), Text('Two'), Text('Three')],
            ),
          );
        },
      ),
    );
  }
}
