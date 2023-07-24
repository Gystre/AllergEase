import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Add code to handle tapping the recipe
          // For example, you can open the URL when the ListTile is tapped.
          print('Recipe tapped! Opening URL: ${recipe.url}');
        },
        child: Column(
          children: [
            Image.network(
              recipe.image,
              height: 152,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(recipe.name),
              trailing: Icon(Icons
                  .arrow_forward_ios), // Indicates that the item is clickable
            ),
          ],
        ),
      ),
    );
  }
}
