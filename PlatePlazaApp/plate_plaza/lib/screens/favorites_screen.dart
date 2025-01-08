import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/favorites_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
        backgroundColor: const Color(0xFFFFC3A0),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite recipes yet!'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final recipe = favorites[index];
          return ListTile(
            title: Text(recipe.name),
            subtitle: Text(recipe.description),
            trailing: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                favoritesProvider.toggleFavorite(recipe);
              },
            ),
            onTap: () {
              Navigator.pushNamed(context, '/recipeDetails',
                  arguments: recipe);
            },
          );
        },
      ),
    );
  }
}