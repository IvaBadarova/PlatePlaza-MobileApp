import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe_model.dart';
import '../state/favorites_provider.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            recipe.imageUrl,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(recipe.name,
            style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        subtitle: Text(recipe.description,
            style: const TextStyle(color: Colors.grey, fontSize: 14.0)),
        trailing: Tooltip(
          message: favoritesProvider.isFavorite(recipe)
              ? "Remove from favorites"
              : "Add to favorites",
          child: IconButton(
            icon: Icon(
              favoritesProvider.isFavorite(recipe)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoritesProvider.isFavorite(recipe) ? Colors.red : null,
            ),
            onPressed: () {
              favoritesProvider.toggleFavorite(recipe);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    favoritesProvider.isFavorite(recipe)
                        ? 'You added this recipe to favorites!'
                        : 'You removed this recipe from favorites!',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
          ),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/recipeDetails',
            arguments: recipe,
          );
        },
      ),
    );
  }
}