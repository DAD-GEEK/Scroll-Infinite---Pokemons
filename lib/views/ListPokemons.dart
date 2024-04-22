import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:scroll_infinite/controllers/PokemonController.dart';
import 'package:scroll_infinite/models/Pokemon.dart';

class ListPokemons extends StatefulWidget {
  const ListPokemons({Key? key}) : super(key: key);

  @override
  State<ListPokemons> createState() => _ListPokemonsState();
}

class _ListPokemonsState extends State<ListPokemons> {
  final PokemonController _controller = PokemonController();
  int _offset = 0;
  bool _loading = false;
  List<Pokemon> _pokemons = [];
  final ScrollController _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    getPokemons();
    _scroll.addListener(() {
      double max = _scroll.position.maxScrollExtent;
      double currentPosition = _scroll.position.pixels;
      if ((currentPosition + 300 >= max) && !_loading) {
        getPokemons();
      }
    });
  }

  createAnimate(double offset) {
    _scroll.animateTo(offset,
        duration: const Duration(microseconds: 300), curve: Curves.bounceIn);
  }

  void getPokemons() async {
    setState(() {
      _loading = true;
    });
    List<Pokemon> pokemons = await _controller.getPokemons(offset: _offset);
    setState(() {
      _pokemons.addAll(pokemons);
      _offset += 20;
      _loading = false;
    });

    double currentPosition = _scroll.position.pixels;
    double max = _scroll.position.maxScrollExtent;
    double offset = currentPosition + 100;
    if (offset >= max) createAnimate(offset);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // implement any logic here
        _pokemons = await _controller.getPokemons(offset: 0);
        setState(() {
          _offset = 0;
        });
      },
      child: Stack(
        children: [
          createListView(),
          if (_loading) createProgress(),
        ],
      ),
    );
  }

  createProgress() {
    return Positioned(
      bottom: 10,
      left: MediaQuery.of(context).size.width / 2 - 10,
      child: CircularProgressIndicator(),
    );
  }

  ListView createListView() {
    return ListView.builder(
      controller: _scroll,
      itemBuilder: (context, index) {
        Pokemon pokemon = _pokemons[index];
        return ListTile(
          title: Text(pokemon.name),
          subtitle: Text(pokemon.url),
        );
      },
      itemCount: _pokemons.length,
    );
  }
}
