import '../models/recipe.dart';

final List<Recipe> sampleRecipes = [
  Recipe(
    name: 'Spaghetti Bolognese',
    imagePath: 'assets/images/pasta.jpg',
    ingredients: ['Spaghetti', 'Ground beef', 'Tomato sauce', 'Onion', 'Garlic'],
    instructions: 'Cook pasta. Brown beef with onion & garlic. Add sauce. Combine & serve.',
  ),
  Recipe(
    name: 'Pizza',
    imagePath: 'assets/images/pizza.jpg',
    ingredients: ['Tomato', 'Dough', 'Tomato sauce', 'Mozarella', 'Garlic Oil', 'Basil', 'Olive Oil'],
    instructions: 'Spread sauce on dough. Add toppings. Bake until crust is golden.',
  ),
  Recipe(
    name: 'Clam Chowder',
    imagePath: 'assets/images/clamchowder.jpg',
    ingredients: ['Clams', 'Heavy cream', 'Milk', 'Onion', 'Potatoes', 'Bacon', 'Thyme', 'Bay leaf', 'Salt', 'Pepper', 'Parsley'],
    instructions: 'Cook clams in heavy cream and milk. Add onions, potatoes, bacon, thyme, bay leaf, salt, pepper and parsley. Simmer until thick.',
  ),
  Recipe(
    name: 'Gelato',
    imagePath: 'assets/images/gelato.jpg',
    ingredients: ['Milk', 'Sugar', 'Vanilla extract', 'Egg yolks', 'Heavy cream'],
    instructions: 'Combine milk, sugar, vanilla extract and egg yolks. Cook until thickened. Add heavy cream. Chill and serve.',
  ),
  Recipe(
    name: 'Tiramisu',
    imagePath: 'assets/images/tiramisu.jpg',
    ingredients: ['Mascarpone cheese', 'Eggs', 'Sugar', 'Coffee', 'Ladyfingers', 'Cocoa powder'],
    instructions: 'Whisk mascarpone cheese, eggs and sugar. Dip ladyfingers in coffee. Layer with mascarpone mixture and cocoa powder.',
  ),
];