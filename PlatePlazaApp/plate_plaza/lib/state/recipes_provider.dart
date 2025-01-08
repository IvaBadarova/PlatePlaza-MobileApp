import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipesProvider extends ChangeNotifier {
  final List<Recipe> _recipes = [
    Recipe(
        name: 'Spaghetti',
        description: 'A classic Italian dish with tomato sauce.',
        imageUrl:
        'https://plus.unsplash.com/premium_photo-1664391765043-57f702c4d41d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3BhZ2hldHRpfGVufDB8fDB8fHww',
        ingredients: [
          '200g spaghetti',
          '2 tablespoons olive oil',
          '1 clove garlic',
          '1 can of diced tomatoes',
          'Salt and pepper to taste',
          'Fresh basil leaves'
        ],
        steps: [
          'Boil water and cook spaghetti according to package instructions.',
          'In a separate pan, heat olive oil and sauté garlic until fragrant.',
          'Add diced tomatoes to the pan, season with salt and pepper, and simmer for 10 minutes.',
          'Drain spaghetti and mix with the sauce.',
          'Serve with fresh basil on top.'
        ]),
    Recipe(
        name: 'Grilled Cheese',
        description: 'A simple and delicious sandwich.',
        imageUrl:
        'https://images.unsplash.com/photo-1528736235302-52922df5c122?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z3JpbGxlZCUyMGNoZWVzZXxlbnwwfHwwfHx8MA%3D%3D',
        ingredients: [
          '2 slices of bread',
          '2 slices of cheese (cheddar or American)',
          'Butter for grilling'
        ],
        steps: [
          'Butter one side of each slice of bread.',
          'Place cheese between the slices of bread, with the buttered side facing out.',
          'Grill on medium heat until both sides are golden and the cheese is melted.'
        ]),
    Recipe(
        name: 'Pizza',
        description: 'Cheese, tomato, and your favorite toppings.',
        imageUrl:
        'https://plus.unsplash.com/premium_photo-1673439304183-8840bd0dc1bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGl6emF8ZW58MHx8MHx8fDA%3D',
        ingredients: [
          '1 pizza dough',
          '1/2 cup tomato sauce',
          '1 cup shredded mozzarella cheese',
          'Olive oil',
          'Salt and pepper to taste',
          'Fresh basil (optional)'
        ],
        steps: [
          'Preheat your oven to 475°F (245°C).',
          'Roll out the pizza dough onto a baking sheet.',
          'Spread tomato sauce on the dough and sprinkle with mozzarella cheese.',
          'Drizzle olive oil over the top, season with salt and pepper.',
          'Bake in the oven for 10-12 minutes or until the crust is golden brown.',
          'Garnish with fresh basil before serving.'
        ]),
    Recipe(
        name: 'Pasta Carbonara',
        description: 'A creamy pasta with eggs, cheese, pancetta, and pepper.',
        imageUrl:
        'https://images.unsplash.com/photo-1574885014162-92e4f12928db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGFzdGElMjBjYXJib25hcmF8ZW58MHx8MHx8fDA%3D',
        ingredients: [
          '200g pasta (spaghetti or fettuccine)',
          '100g pancetta or bacon',
          '2 eggs',
          '1/2 cup grated Parmesan cheese',
          '1/2 cup heavy cream',
          'Salt and pepper to taste'
        ],
        steps: [
          'Cook pasta in boiling salted water according to package instructions.',
          'In a skillet, cook pancetta until crispy.',
          'In a bowl, whisk together eggs, Parmesan, and heavy cream.',
          'Toss the cooked pasta with the pancetta and egg mixture off the heat.',
          'Serve with additional Parmesan and black pepper.'
        ]),
    Recipe(
        name: 'Caesar Salad',
        description:
        'A salad with romaine lettuce, croutons, and Caesar dressing.',
        imageUrl:
        'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=500&auto=format&fit=crop&q=60&ixib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGNhc2VyJTIwc2FsYWR8ZW58MHx8MHx8fDA%3D',
        ingredients: [
          '1 head romaine lettuce',
          '1 cup croutons',
          '1/2 cup Caesar dressing',
          '1/4 cup Parmesan cheese',
          '1 tablespoon lemon juice'
        ],
        steps: [
          'Chop lettuce and place it in a large bowl.',
          'Toss lettuce with Caesar dressing and croutons.',
          'Top with Parmesan cheese and a squeeze of lemon juice.'
        ]),
  ];

  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }
}