import 'package:flutter/material.dart';
import 'package:recipe_book_app/data/recipes_data.dart';
import 'package:recipe_book_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// Italian-inspired color palette
class AppColors {
  static const Color terracotta = Color(0xFFC45B2C);
  static const Color oliveGreen = Color(0xFF2D5A27);
  static const Color cream = Color(0xFFFAF6F0);
  static const Color wine = Color(0xFF722F37);
  static const Color warmWhite = Color(0xFFFFFBF5);
  static const Color espresso = Color(0xFF3D2914);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.terracotta,
          secondary: AppColors.oliveGreen,
          surface: AppColors.warmWhite,
          error: AppColors.wine,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: AppColors.espresso,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.cream,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.oliveGreen,
          foregroundColor: AppColors.warmWhite,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          color: AppColors.warmWhite,
          elevation: 4,
          shadowColor: AppColors.terracotta.withValues(alpha: 0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.espresso,
            letterSpacing: -0.5,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.oliveGreen,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      home: HomeScreen(sampleRecipes: sampleRecipes),
    );
  }
}
