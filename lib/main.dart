import 'package:flutter/material.dart';
import 'package:pokemon_app/app_navigator.dart';
import 'package:pokemon_app/bloc/nav_cubit.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc()
            ..add(
              PokemonPageRequest(page: 0),
            ),
        ),
        BlocProvider(
          create: (context) => NavCubit(
            pokemonDetailsCubit: pokemonDetailsCubit,
          ),
        ),
        BlocProvider(
          create: (context) => pokemonDetailsCubit,
        ),
      ],
      child: MaterialApp(
        title: 'Pokedex',
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.red,
          accentColor: Colors.redAccent,
        ),
        home: AppNavigator(),
      ),
    );
  }
}
