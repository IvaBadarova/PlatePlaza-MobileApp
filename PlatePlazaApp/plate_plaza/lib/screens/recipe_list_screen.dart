import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/recipes_provider.dart';
import '../widgets/recipe_card.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipesProvider = Provider.of<RecipesProvider>(context);
    final recipes = recipesProvider.recipes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
        backgroundColor: const Color(0xFFFFC3A0),
      ),
      body: recipes.isEmpty
          ? const Center(
        child: Text(
          'No recipes available. Add some!',
          style: TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(recipe: recipe);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addRecipe');
        },
        backgroundColor: const Color(0xFFFFC3A0),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}