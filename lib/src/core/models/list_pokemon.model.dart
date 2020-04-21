import 'dart:convert';

ListPokemon listPokemonFromJson(String str) =>
    ListPokemon.fromJson(json.decode(str));

String listPokemonToJson(ListPokemon data) => json.encode(data.toJson());

class ListPokemon {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  ListPokemon({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory ListPokemon.fromJson(Map<String, dynamic> json) => ListPokemon(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String name;
  String url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
