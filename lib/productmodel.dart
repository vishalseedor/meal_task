import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String name;
  final String category;
  final String instructions;
  final String thumbnailUrl;

  Meal(
      {required this.id,
      required this.name,
      required this.category,
      required this.instructions,
      required this.thumbnailUrl});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      instructions: json['strInstructions'],
      thumbnailUrl: json['strMealThumb'],
    );
  }
}
