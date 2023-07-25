import 'package:flutter/material.dart';
import 'dart:convert';
import 'recipe.dart';
import 'recipe_card.dart';
import 'package:allergease/config_dev.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AllergEase",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "AllergEase"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool wheatChecked = false;
  bool peanutsChecked = false;
  bool soyChecked = false;
  bool glutenChecked = false;
  bool error = false;

  List<Recipe> recipes = [];

  Future<void> fetchData() async {
    recipes.clear();
    setState(() {
      error = false;
    });

    if (!wheatChecked && !peanutsChecked && !soyChecked && !glutenChecked) {
      return;
    }

    const appId = AppConfig.edmamAppId;
    const appKey = AppConfig.edmamAppKey;

    String url =
        "https://api.edamam.com/api/recipes/v2?app_id=$appId&app_key=$appKey&type=public&random=true";

    if (wheatChecked) {
      url += "&health=wheat-free";
    }

    if (peanutsChecked) {
      url += "&health=peanut-free";
    }

    if (soyChecked) {
      url += "&health=soy-free";
    }

    if (glutenChecked) {
      url += "&health=gluten-free";
    }

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // valid response from the server, parse the data and update the state
        final json = jsonDecode(response.body);
        final hits = json['hits'];

        for (var hit in hits) {
          final recipe = hit['recipe'];
          final name = recipe['label'];
          final imageUrl = recipe['images']['REGULAR']['url'];
          final url = recipe['url'];

          final newRecipe = Recipe(
            name: name,
            imageUrl: imageUrl,
            url: url,
          );

          setState(() {
            recipes.add(newRecipe);
          });
        }
      } else {
        setState(() {
          error = true;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  String getAllergiesText() {
    if (wheatChecked || peanutsChecked || soyChecked || glutenChecked) {
      String allergiesText = "All of these recipes are ";
      if (wheatChecked) allergiesText += "wheat, ";
      if (peanutsChecked) allergiesText += "peanuts, ";
      if (soyChecked) allergiesText += "soy, ";
      if (glutenChecked) allergiesText += "gluten, ";
      allergiesText = allergiesText.substring(
          0, allergiesText.length - 2); // Remove the last comma and space

      allergiesText += " free!";
      return allergiesText;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: recipes.isEmpty // Check if recipes array is empty
              ? Text(
                  !error
                      ? "^ Select some allergies in the drawer to get some recipe suggestions!"
                      : "You probably hit the api limit on the free plan",
                )
              : Column(
                  children: <Widget>[
                    Text(getAllergiesText()),
                    Expanded(
                      child: ListView.builder(
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(recipe: recipes[index]);
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const Center(
              child: Text("I am allergic to..."),
            ),
            ListTile(
              title: const Text('Wheat'),
              leading: Checkbox(
                value: wheatChecked,
                onChanged: (value) async {
                  setState(() {
                    wheatChecked = value!;
                  });
                  await fetchData();
                },
              ),
            ),
            ListTile(
              title: const Text('Peanuts'),
              leading: Checkbox(
                value: peanutsChecked,
                onChanged: (value) async {
                  setState(() {
                    peanutsChecked = value!;
                  });
                  await fetchData();
                },
              ),
            ),
            ListTile(
              title: const Text('Soy'),
              leading: Checkbox(
                value: soyChecked,
                onChanged: (value) async {
                  setState(() {
                    soyChecked = value!;
                  });
                  await fetchData();
                },
              ),
            ),
            ListTile(
              title: const Text('Gluten'),
              leading: Checkbox(
                value: glutenChecked,
                onChanged: (value) async {
                  setState(() {
                    glutenChecked = value!;
                  });
                  await fetchData();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
