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
          automaticallyImplyLeading: true,
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
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return PokemonGridView(listPokemon: snapshot.data);
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

class PokemonGridView extends StatefulWidget {
  final dynamic listPokemon;
  const PokemonGridView({
    Key key,
    @required this.listPokemon,
  }) : super(key: key);

  @override
  _PokemonGridViewState createState() => _PokemonGridViewState();
}

class _PokemonGridViewState extends State<PokemonGridView> {
  ScrollController _scrollController = ScrollController();
  String nextUrl;

  List<Pokemon> _listPokemon = [];

  @override
  void initState() {
    super.initState();
    _listPokemon =
        List.from(widget.listPokemon['list'] as List<Pokemon>, growable: true);
    nextUrl = widget.listPokemon['next'];
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        nextPokemons(nextUrl);
      }
    });
  }

  void nextPokemons(String url) async {
    var res = await PokemonService.getListPokemon(url: url);
    nextUrl = res['next'];
    print('end');
    setState(() {
      print('end');
      _listPokemon.addAll((res['list'] as List<Pokemon>));
    });
    print('end');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      controller: _scrollController,
      itemCount: _listPokemon.length,
      itemBuilder: (context, index) {
        Pokemon _pokemon = _listPokemon[index];
        return PokemonCard(pokemon: _pokemon);
      },
    );
  }
}
