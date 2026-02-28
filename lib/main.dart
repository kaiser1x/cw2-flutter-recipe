import 'package:flutter/material.dart';
import 'package:recipe_book_app/data/recipes_data.dart';
import 'package:recipe_book_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(sampleRecipes: sampleRecipes),
    );
  }
}
