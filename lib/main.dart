import 'package:flutter/material.dart';
import 'package:pokemon_app/pokedex_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.red,
        accentColor: Colors.redAccent,
      ),
      home: PokedexView(),
    );
  }
}
