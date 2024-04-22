import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scroll_infinite/models/Pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonController {
  final String url = 'https://pokeapi.co/api/v2/pokemon';

  // Method to get all pokemons
  Future<List<Pokemon>> getPokemons({required int offset}) async {
    List<Pokemon> pokemons = [];
    Uri uri = Uri.parse('$url?offset=$offset&limit=20');
    http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Error getting pokemons');
    }
    Map<String, dynamic> json = jsonDecode(response.body);
    List results = json['results'] as List;
    for (var item in results) {
      pokemons.add(Pokemon(name: item['name'], url: item['url']));
    }
    return pokemons;
  }

  // Method to get a pokemon by id
  String getPokemonById(int id) {
    return 'Pikachu';
  }

  // Method to create a pokemon
  String createPokemon(String name) {
    return 'Pikachu';
  }

  // Method to update a pokemon
  String updatePokemon(int id, String name) {
    return 'Pikachu';
  }

  // Method to delete a pokemon
  String deletePokemon(int id) {
    return 'Pikachu';
  }
}
