import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name,
            style: const TextStyle(fontWeight: FontWeight.w500)),
        backgroundColor: const Color(0xFFFFC3A0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(recipe.imageUrl),
            const SizedBox(height: 16),
            Text(
              recipe.description,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ingredients:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            ...recipe.ingredients.map((ingredient) => ListTile(
              title: Text(ingredient),
              leading: const Icon(Icons.check, color: Colors.green),
            )),
            const SizedBox(height: 16),
            const Text(
              'Steps:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            ...recipe.steps.map((step) => ListTile(
              title: Text(step),
              leading: const Icon(Icons.arrow_forward_ios, size: 16),
            )),
          ],
        ),
      ),
    );
  }
}