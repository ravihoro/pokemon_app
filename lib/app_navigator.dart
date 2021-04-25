import 'package:flutter/material.dart';
import 'package:pokemon_app/pokedex_view.dart';
import 'package:pokemon_app/pokemon_details_view.dart';
import './bloc/nav_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(
      builder: (context, pokemonId) {
        return Navigator(
          pages: [
            MaterialPage(
              child: PokedexView(),
            ),
            if (pokemonId != null)
              MaterialPage(
                child: PokemonDetailsView(),
              ),
          ],
          onPopPage: (route, result) {
            context.read<NavCubit>().popToPokedex();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
