import 'package:flutter/material.dart';
import 'package:pokemon_app/src/ui/pages/pokedex/pokedex.page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'What Pokemon \nare you looking for?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  focusColor: Colors.deepOrange,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide: BorderSide(style: BorderStyle.none),
                  ),
                  hintText: 'Search Pokemons, movies, Ability, etc.',
                  hintStyle: TextStyle(fontSize: 13.0),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: MainMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Table(
        children: [
          TableRow(
            children: [
              MainMenuItem(
                title: 'Pokedex',
                color: Colors.cyan,
                onPressed: () {
                  Navigator.push(context, PokedexPage.route());
                },
              ),
              MainMenuItem(
                title: 'Moves',
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
          TableRow(children: [
            MainMenuItem(
              title: 'Abilities',
              color: Colors.blue,
              onPressed: () {},
            ),
            MainMenuItem(
              title: 'Items',
              color: Colors.yellow,
              onPressed: () {},
            ),
          ]),
          TableRow(children: [
            MainMenuItem(
              title: 'Locations',
              color: Colors.purple,
              onPressed: () {},
            ),
            MainMenuItem(
              title: 'Type Charts',
              color: Colors.brown,
              onPressed: () {},
            ),
          ]),
        ],
      ),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;

  const MainMenuItem(
      {@required this.title, @required this.color, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      margin: EdgeInsets.all(6.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -20.0,
                top: -10.0,
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
                top: -35.0,
                left: -35.0,
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(
                      35.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
