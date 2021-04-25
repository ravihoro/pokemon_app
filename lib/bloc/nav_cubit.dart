import 'package:bloc/bloc.dart';
import 'package:pokemon_app/bloc/pokemon_details_cubit.dart';
import 'package:meta/meta.dart';

class NavCubit extends Cubit<int> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({@required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    pokemonDetailsCubit.clearPokemonDetails();
    emit(null);
  }
}
