import 'package:flutter/material.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/pokedex_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0))),
      ],
      child: MaterialApp(
        title: 'Pokedex',
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.red,
          accentColor: Colors.redAccent,
        ),
        home: PokedexView(),
      ),
    );
  }
}
