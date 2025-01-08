import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/recipe_list_screen.dart';
import '../screens/recipe_details_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/add_recipe_screen.dart';
import '../models/recipe_model.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/recipes':
        return MaterialPageRoute(builder: (_) => const RecipeListScreen());
      case '/recipeDetails':
        final recipe = settings.arguments as Recipe;
        return MaterialPageRoute(
            builder: (_) => RecipeDetailScreen(recipe: recipe));
      case '/favorites':
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case '/addRecipe':
        return MaterialPageRoute(builder: (_) => const AddRecipeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}