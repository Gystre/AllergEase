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
              recipe.imageUrl,
              height: 152,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // not sure if this works, since still sometimes breaks on bad image urls but can't reliably reproduce
                return Image.asset(
                  'assets/placeholder_image.png', // Replace with your placeholder image asset
                  height: 152,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
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
