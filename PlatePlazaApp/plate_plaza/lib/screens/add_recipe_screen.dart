import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/recipes_provider.dart';
import '../models/recipe_model.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _imageUrl = '';
  final List<String> _ingredients = [];
  final List<String> _steps = [];
  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _stepController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newRecipe = Recipe(
        name: _name,
        description: _description,
        imageUrl: _imageUrl.isNotEmpty
            ? _imageUrl
            : 'https://via.placeholder.com/150',
        ingredients: _ingredients,
        steps: _steps,
      );

      Provider.of<RecipesProvider>(context, listen: false).addRecipe(newRecipe);
      Navigator.pop(context); // Close the screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
        backgroundColor: const Color(0xFFFFC3A0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Recipe Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipe name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration:
                const InputDecoration(labelText: 'Image URL (Optional)'),
                onSaved: (value) {
                  _imageUrl = value!;
                },
              ),
              const SizedBox(height: 16),
              const Text('Ingredients'),
              ..._ingredients.map((ingredient) =>
                  ListTile(
                    title: Text(ingredient),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _ingredients.remove(ingredient);
                        });
                      },
                    ),
                  )),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ingredientController,
                      decoration:
                      const InputDecoration(labelText: 'Add Ingredient'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_ingredientController.text.isNotEmpty) {
                        setState(() {
                          _ingredients.add(_ingredientController.text);
                          _ingredientController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Steps'),
              ..._steps.map((step) =>
                  ListTile(
                    title: Text(step),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _steps.remove(step);
                        });
                      },
                    ),
                  )),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _stepController,
                      decoration: const InputDecoration(labelText: 'Add Step'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_stepController.text.isNotEmpty) {
                        setState(() {
                          _steps.add(_stepController.text);
                          _stepController.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                  const Color(0xFFFFC3A0),
                ),
                child: const Text('Add Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}