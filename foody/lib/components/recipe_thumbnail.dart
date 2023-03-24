import 'package:flutter/material.dart';
import 'package:foody/models/simple_recipe.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                recipe.dishImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // 7
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
