import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/src/core/const/endpoints.dart';
import 'package:pokemon_app/src/core/models/pokemon.model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({Key key, this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
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
                  pokemon.name,
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
                      pokemon.types[0].type.name,
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
                imageUrl: kPokemonImageEndPoint + '${pokemon.id}.png',
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
