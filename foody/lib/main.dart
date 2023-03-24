import 'package:flutter/material.dart';
import 'package:foody/foody_theme.dart';
import 'package:foody/home.dart';
import 'package:foody/models/models.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FoodyApp());
}

class FoodyApp extends StatelessWidget {
  const FoodyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FoodyTheme.dark();

    return MaterialApp(
      title: 'Foody',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
