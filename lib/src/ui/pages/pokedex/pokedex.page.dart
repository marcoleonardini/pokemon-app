import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/const/endpoints.dart';
import '../../../core/models/pokemon.model.dart';
import '../../../core/services/pokemon.service.dart';

class PokedexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          child: FutureBuilder(
            future: PokemonService.getListPokemon(),
            builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
              print(snapshot.data);
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
                  print(_pokemon.id);
                  return _pokemonCard(_pokemon);
                  // ListTile(
                  //   leading: CachedNetworkImage(
                  //     imageUrl: kPokemonImageEndPoint + '${_pokemon.id}.png',
                  //     imageBuilder: (context, imageProvider) {
                  //       return CircleAvatar(
                  //         backgroundImage: imageProvider,
                  //         radius: 22.0,
                  //       );
                  //     },
                  //   ),
                  //   title: Text(_pokemon.name),
                  // );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  _pokemonCard(Pokemon _pokemon) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.red[800],
      ),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _pokemon.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 6.0),
                  elevation: 0.0,
                  color: Colors.white24,
                  shape: StadiumBorder(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4,
                    ),
                    child: Text(
                      _pokemon.types[0].type.name,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.55,
              heightFactor: 0.6,
              child: CachedNetworkImage(
                imageUrl: kPokemonImageEndPoint + '${_pokemon.id}.png',
                fit: BoxFit.contain,
                fadeInCurve: Curves.bounceInOut,
              ),
            ),
          )
        ],
      ),
    );
  }
}
