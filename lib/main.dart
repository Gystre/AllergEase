import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_card.dart';
import 'config_dev.dart';
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

  List<Recipe> recipes = [
    Recipe(
      image:
          "https://edamam-product-images.s3.amazonaws.com/web-img/b67/b678fe8cdc12b246b6ad74f6fdc16406.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQDts8V5M44HBFQeRUy2jXr4nm6oK1GRlyUdKKEptJrgIQIgWX0KovhOAwRqP%2Fb%2F1qS%2FXU0D7YfW5%2BZYtob5eBqbDoYquAUIHhAAGgwxODcwMTcxNTA5ODYiDGBDIbRHLmmiRQzpzyqVBRztcRrqjcruOqqCdk6F0Vrmf0oPmnMSpgp3KPvTCuAnZCf0zHplXFdKXAmI32krodfvKUapwI7vFpYIX4ZTI%2F7GLYCu9pIZqLLJCunF9DIx%2BOg%2Bg5H%2FVomz0djF0oDxkwL0xn4HgeXqeTY8w88NzVWniqbVhkY0PI4horaRPOeStvCfVs6Nx6Aq3Gd8%2BXipFoYeDcqWaiYuj0BqWcogXHVIs%2Baj7%2FyPH1Pr0izI2zQcgjtXgoCBcNXoZyC4A25dnYKzyhn10JIU3O8WiiQTZbbkgJe4nRFc%2FKnszwQeN4ME%2FNkPcKnc0kPNKhwPeyzF81DvWX4GhCEXSguj32Pjy1yEioeZ%2FU8JyOKZXZiUlRohtpC3IgMJp0SLsBotvvB7SIlyc8BM7a%2FKzonKg2ZwoETht9pa%2Bbm4FEZTj7bhAt2VS%2F4uPKXt4vudbs%2FIQZbBo93jv9oHNMCgYXkPSL4Mf6kPQIIrv%2FX34JL62rbV7YedELjn%2BHW2bgfyAhtXu24oLOkL2rD38QLbypa3%2B7AW8Y1NvoFvVwnq7H0KsZRCvlx%2FvkQo7V3gelptbUZW%2BdtaOdgWeBFkS74pJoPpQf5CClTVPyjZcMNEXIOnhvVZMUVfr8594%2FXlnMOmeNAcmdmvSkfhiHlp0xmnlOvtDkG4Q9LBEmrv9LggyRKA7zGK%2FwhVKpS6miWz1vL%2Bx%2Fm1R7eYtJ8m80TiMHhjfFFiE%2FnpsmbbWEOUyS%2BUL%2B7yL32HSJWn%2FzNQhtskJJ3DtKXk%2Fi0v%2FuTJyjf3crsAd5T6l6vxwk5PSzkS6pGe0hIgFVGY3WqOMFFhMJLCy2Sb5IDm%2FZzFUVdJcv2AGJqQoXwS6TlTwlatuJpCwWffK2sZJyPkEL9WxVrUfqcwkrv7pQY6sQE%2FVfdSRMEwiMvecbOCSXkYYUGayEQmtAQNQ2WUVDGL%2B%2FLhkgv2V6Sr%2FNF%2BNWVzZVbxT9lztppmIphVPYzF84q%2BdewKpKTEuaGubzSh8Ae4w%2Bv4X5utqt8Tqgh7QAzhEAXBii6GKBq6U2QonHbyg40%2B7nJWePfODqwy1N0%2F%2FjkGJ43seTsUoQBIJpyGJtt2SMXMVlzPDWfEtPxhbI%2BKXozegynQVouqp3Q8HAr6D%2FH7wHw%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230724T211953Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFECKXSGVX%2F20230724%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d7544baf528cbb6afb1fd8a252dc7d42c858ef0c38ea0a6b5c2ace061db072bd",
      name: "Easy Mango Chicken Over Coconut Rice",
      url:
          "http://realmomkitchen.com/1344/easy-mango-chicken-over-coconut-rice/",
    ),
    Recipe(
      image:
          "https://edamam-product-images.s3.amazonaws.com/web-img/b67/b678fe8cdc12b246b6ad74f6fdc16406.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQDts8V5M44HBFQeRUy2jXr4nm6oK1GRlyUdKKEptJrgIQIgWX0KovhOAwRqP%2Fb%2F1qS%2FXU0D7YfW5%2BZYtob5eBqbDoYquAUIHhAAGgwxODcwMTcxNTA5ODYiDGBDIbRHLmmiRQzpzyqVBRztcRrqjcruOqqCdk6F0Vrmf0oPmnMSpgp3KPvTCuAnZCf0zHplXFdKXAmI32krodfvKUapwI7vFpYIX4ZTI%2F7GLYCu9pIZqLLJCunF9DIx%2BOg%2Bg5H%2FVomz0djF0oDxkwL0xn4HgeXqeTY8w88NzVWniqbVhkY0PI4horaRPOeStvCfVs6Nx6Aq3Gd8%2BXipFoYeDcqWaiYuj0BqWcogXHVIs%2Baj7%2FyPH1Pr0izI2zQcgjtXgoCBcNXoZyC4A25dnYKzyhn10JIU3O8WiiQTZbbkgJe4nRFc%2FKnszwQeN4ME%2FNkPcKnc0kPNKhwPeyzF81DvWX4GhCEXSguj32Pjy1yEioeZ%2FU8JyOKZXZiUlRohtpC3IgMJp0SLsBotvvB7SIlyc8BM7a%2FKzonKg2ZwoETht9pa%2Bbm4FEZTj7bhAt2VS%2F4uPKXt4vudbs%2FIQZbBo93jv9oHNMCgYXkPSL4Mf6kPQIIrv%2FX34JL62rbV7YedELjn%2BHW2bgfyAhtXu24oLOkL2rD38QLbypa3%2B7AW8Y1NvoFvVwnq7H0KsZRCvlx%2FvkQo7V3gelptbUZW%2BdtaOdgWeBFkS74pJoPpQf5CClTVPyjZcMNEXIOnhvVZMUVfr8594%2FXlnMOmeNAcmdmvSkfhiHlp0xmnlOvtDkG4Q9LBEmrv9LggyRKA7zGK%2FwhVKpS6miWz1vL%2Bx%2Fm1R7eYtJ8m80TiMHhjfFFiE%2FnpsmbbWEOUyS%2BUL%2B7yL32HSJWn%2FzNQhtskJJ3DtKXk%2Fi0v%2FuTJyjf3crsAd5T6l6vxwk5PSzkS6pGe0hIgFVGY3WqOMFFhMJLCy2Sb5IDm%2FZzFUVdJcv2AGJqQoXwS6TlTwlatuJpCwWffK2sZJyPkEL9WxVrUfqcwkrv7pQY6sQE%2FVfdSRMEwiMvecbOCSXkYYUGayEQmtAQNQ2WUVDGL%2B%2FLhkgv2V6Sr%2FNF%2BNWVzZVbxT9lztppmIphVPYzF84q%2BdewKpKTEuaGubzSh8Ae4w%2Bv4X5utqt8Tqgh7QAzhEAXBii6GKBq6U2QonHbyg40%2B7nJWePfODqwy1N0%2F%2FjkGJ43seTsUoQBIJpyGJtt2SMXMVlzPDWfEtPxhbI%2BKXozegynQVouqp3Q8HAr6D%2FH7wHw%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230724T211953Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFECKXSGVX%2F20230724%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=d7544baf528cbb6afb1fd8a252dc7d42c858ef0c38ea0a6b5c2ace061db072bd",
      name: "Easy Mango Chicken Over Coconut Rice",
      url:
          "http://realmomkitchen.com/1344/easy-mango-chicken-over-coconut-rice/",
    )
  ];

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
              ? const Text(
                  "^ Select some allergies in the drawer to get some recipe suggestions!",
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
            ListTile(
              title: Text('Wheat'),
              leading: Checkbox(
                value: wheatChecked,
                onChanged: (value) {
                  setState(() {
                    wheatChecked = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Peanuts'),
              leading: Checkbox(
                value: peanutsChecked,
                onChanged: (value) {
                  setState(() {
                    peanutsChecked = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Soy'),
              leading: Checkbox(
                value: soyChecked,
                onChanged: (value) {
                  setState(() {
                    soyChecked = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Gluten'),
              leading: Checkbox(
                value: glutenChecked,
                onChanged: (value) {
                  setState(() {
                    glutenChecked = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
