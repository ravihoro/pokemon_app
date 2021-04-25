import 'package:meta/meta.dart';

class PokemonListing {
  final int id;
  final String name;

  String get imageUrl =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png";

  PokemonListing({
    @required this.id,
    @required this.name,
  });

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    List<String> list = url.split("/");
    final id = list[list.length - 2];
    // print(id);
    // print(id.runtimeType);
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
    final pokemonListings = (json['results'] as List)
        .map((e) => PokemonListing.fromJson(e))
        .toList();
    return PokemonPageResponse(
      pokemonListings: pokemonListings,
      canLoadNextPage: canLoadNextPage,
    );
  }
}
