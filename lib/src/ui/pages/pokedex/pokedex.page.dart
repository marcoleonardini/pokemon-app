import 'package:flutter/material.dart';

import '../../../core/models/pokemon.model.dart';
import '../../../core/services/pokemon.service.dart';
import 'pokemon_card.widget.dart';

class PokedexPage extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => PokedexPage(),
    );
  }

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
          padding: EdgeInsets.all(16.0),
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Pokedex',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: PokemonService.getListPokemon(),
                  builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.4,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
