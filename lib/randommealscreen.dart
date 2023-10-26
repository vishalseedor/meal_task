import 'package:demo_task/productmodel.dart';
import 'package:flutter/material.dart';

import 'mealprovider.dart';

class RandomMealScreen extends StatefulWidget {
  const RandomMealScreen({Key? key}) : super(key: key);

  @override
  State<RandomMealScreen> createState() => _RandomMealScreenState();
}

class _RandomMealScreenState extends State<RandomMealScreen> {
  final ApiManager _apiManager = ApiManager();
  Meal? _meal; // Declare _meal as nullable
  @override
  void initState() {
    super.initState();
    _loadRandomMeal();
  }

  Future<void> _loadRandomMeal() async {
    try {
      Meal meal = await _apiManager.getRandomMeal();
      setState(() {
        _meal = meal;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meal Details',
            style: TextStyle(
                color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.amber,
            ),
          ),
        ),
        body: _meal != null
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ElevatedButton.icon(
                            onPressed: _loadRandomMeal,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            icon: const Icon(
                              Icons.refresh,
                              color: Colors.amber,
                            ),
                            label: const Text(
                              'Refresh',
                              style: TextStyle(color: Colors.amber),
                            )),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Center(
                        child: Image.network(_meal!.thumbnailUrl,
                            height: 300, width: 400, fit: BoxFit.cover),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Name: ${_meal!.name}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text('Category: ${_meal!.category}',
                          style: const TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: size.height * 0.02),
                      const Text(
                        'Product Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'Instructions: ${_meal!.instructions}',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ));
  }
}
