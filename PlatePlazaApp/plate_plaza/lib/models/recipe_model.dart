class Recipe {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });
}