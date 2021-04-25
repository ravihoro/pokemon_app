import 'package:meta/meta.dart';

class PokemonListing {
  final int id;
  final String name;

  PokemonListing({
    @required this.id,
    @required this.name,
  });

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    List<String> list = url.split("/");
    final id = list[list.length - 1];
    return PokemonListing(
      id: int.parse(id),
      name: name,
    );
  }
}

class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageResponse({
    @required this.pokemonListings,
    @required this.canLoadNextPage,
  });

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['result'] as List)
        .map((e) => PokemonListing.fromJson(e))
        .toList();
    return PokemonPageResponse(
      pokemonListings: pokemonListings,
      canLoadNextPage: canLoadNextPage,
    );
  }
}
