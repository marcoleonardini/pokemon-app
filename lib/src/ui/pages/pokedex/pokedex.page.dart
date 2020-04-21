import 'package:flutter/material.dart';

import '../../../core/models/pokemon.model.dart';
import '../../../core/services/pokemon.service.dart';
import 'pokemon_card.widget.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Icon(Icons.arrow_back_ios),
          actions: <Widget>[
            Icon(
              Icons.menu,
            ),
          ],
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Container(
          color: Colors.white,
          constraints: BoxConstraints.expand(),
          child: FutureBuilder(
            future: PokemonService.getListPokemon(),
            builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.25,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  Pokemon _pokemon = snapshot.data[index];
                  return PokemonCard(pokemon: _pokemon);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
