import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_app/data/pokemon_page_response.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future<dynamic> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      print(json);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      print(json);
    } catch (e) {
      print(e);
    }
  }
}
