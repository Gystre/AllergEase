import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(recipe.url))) {
            throw Exception('Could not launch url');
          }
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
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
