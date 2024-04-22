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

  @override
  void initState() {
    // TODO: implement initState
    
   getPokemons();
    super.initState();
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
  }


  @override
  Widget build(BuildContext context) {
    return createListView();
  }
  
  ListView createListView() {
    return ListView.builder(
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
