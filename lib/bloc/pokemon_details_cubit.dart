import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/data/pokemon_details.dart';
import 'package:pokemon_app/data/pokemon_info_response.dart';
import 'package:pokemon_app/data/pokemon_repository.dart';
import 'package:pokemon_app/data/pokemon_species_info.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  PokemonDetailsCubit() : super(null);

  PokemonRepository _pokemonRepository = PokemonRepository();

  void clearPokemonDetails() => emit(null);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId),
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final pokemonSpeciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
      description: pokemonSpeciesInfo.description,
      id: pokemonInfo.id,
      imageUrl: pokemonInfo.imageUrl,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      name: pokemonInfo.name,
      types: pokemonInfo.types,
    ));
  }
}
