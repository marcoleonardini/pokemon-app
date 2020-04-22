import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/src/core/const/endpoints.dart';
import 'package:pokemon_app/src/core/models/pokemon.model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({Key key, this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = pokemon.getBackgroundColor();
    return Container(
      // margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor.withOpacity(0.85),
      ),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            bottom: -20,
            right: -20,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'images/pokeball.png',
                color: Colors.white,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 15,
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
                SizedBox(
                  height: 8.0,
                ),
                BuildListType(pokemon: pokemon),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.55,
              heightFactor: 0.75,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: CachedNetworkImage(
                  imageUrl: kPokemonImageEndPoint + '${pokemon.id}.png',
                  fit: BoxFit.contain,
                  fadeInCurve: Curves.bounceInOut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildListType extends StatelessWidget {
  const BuildListType({
    Key key,
    @required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    if (pokemon.types.length == 1) {
      return Column(
        children: <Widget>[
          PokemonTypeCard(pokemonType: pokemon.types[0]),
        ],
      );
    }

    pokemon.types.sort((a, b) => a.slot.compareTo(b.slot));
    final List _types =
        pokemon.types.map((e) => PokemonTypeCard(pokemonType: e)).toList();

    return Column(children: _types);
  }
}

class PokemonTypeCard extends StatelessWidget {
  const PokemonTypeCard({
    Key key,
    @required this.pokemonType,
  }) : super(key: key);

  final Type pokemonType;

  @override
  Widget build(BuildContext context) {
    return Card(
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
          pokemonType.type.name,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
