import 'package:pokemon_app/src/core/const/endpoints.dart';
import 'package:pokemon_app/src/core/models/list_pokemon.model.dart';

import 'package:pokemon_app/src/core/models/pokemon.model.dart';

import 'package:http/http.dart' as http;

class PokemonService {
  static Future<dynamic> getListPokemon(
      {String url = kListPokemonEndpoint}) async {
    var response = await http.get(url);
    ListPokemon listPokemon = listPokemonFromJson(response.body);

    List<Future<Pokemon>> futures = List.from(
        listPokemon.results.map<Future<Pokemon>>((e) => getPokemon(e.url)));

    List<Pokemon> res = await Future.wait(futures);
    return {'next': listPokemon.next, 'list': res};
  }

  static Future<Pokemon> getPokemon(url) async {
    var response = await http.get(url);
    Pokemon pokemon = pokemonFromJson(response.body);
    return pokemon;
  }
}
