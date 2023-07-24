import 'package:flutter/material.dart';

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
          child: Column(
            children: <Widget>[
              const Text(
                "^ Select some allergies in the drawer to get some recipe suggestions!",
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
