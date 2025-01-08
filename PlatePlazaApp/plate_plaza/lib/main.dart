import 'package:flutter/material.dart';
import 'package:plate_plaza/router/app_router.dart';
import '../screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'state/favorites_provider.dart';
import 'state/recipes_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => RecipesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}