import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/nav_cubit.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';

class PokedexView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              itemCount: state.pokemonListings.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context
                        .read<NavCubit>()
                        .showPokemonDetails(state.pokemonListings[index].id);
                  },
                  child: Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListings[index].imageUrl),
                          Text(
                            state.pokemonListings[index].name,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(
                state.error.toString(),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
