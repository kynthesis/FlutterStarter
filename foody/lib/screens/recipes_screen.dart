import 'package:flutter/material.dart';
import 'package:foody/api/mock_foody_service.dart';
import 'package:foody/components/components.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockFoodyService();

  RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
