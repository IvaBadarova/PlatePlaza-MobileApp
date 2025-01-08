import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Recipe> _favorites = [];

  List<Recipe> get favorites => _favorites;

  void toggleFavorite(Recipe recipe) {
    if (_favorites.contains(recipe)) {
      _favorites.remove(recipe);
    } else {
      _favorites.add(recipe);
    }
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    return _favorites.contains(recipe);
  }
}