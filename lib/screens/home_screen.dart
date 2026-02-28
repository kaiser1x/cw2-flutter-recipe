import 'package:flutter/material.dart';
import 'package:recipe_book_app/models/recipe.dart';
import 'package:recipe_book_app/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> sampleRecipes;

  const HomeScreen({super.key, required this.sampleRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipes')),
      body: ListView.builder(
        itemCount: sampleRecipes.length,
        itemBuilder: (context, index) {
          final recipe = sampleRecipes[index];
          return Card(
            child: ListTile(
              leading: Image.asset(recipe.imagePath, width: 56, fit: BoxFit.cover),
              title: Text(recipe.name),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsScreen(recipe: recipe),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}