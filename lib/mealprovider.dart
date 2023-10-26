import 'dart:convert';
import 'package:demo_task/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  Future<Meal> getRandomMeal() async {
    final response = await http
        .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final mealData = data['meals'][0];
      return Meal.fromJson(mealData);
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
