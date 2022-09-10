import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poke_api/mock/constants.dart';
import 'package:poke_api/models/pokemon.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Dio()
        .get("https://pokeapi.co/api/v2/pokemon?limit=100&offset=0")
        .then((value) {
      List response = value.data["results"];
      for (var i = 0; i < response.length; i++) {
        print(response[i]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Pokemon> pokeApiList = [
      Pokemon(
        id: 1,
        name: "Bulbassauro",
        imageSrc: "",
        types: "",
      ),
      Pokemon(
        id: 2,
        name: "Charizzard",
        imageSrc: "",
        types: "",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Poke-Api"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search for Pokemon",
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pokeApiList.length,
                itemBuilder: (context, index) => PokemonListItem(
                  poke: pokeApiList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonListItem extends StatefulWidget {
  final Pokemon poke;
  const PokemonListItem({
    required this.poke,
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonListItem> createState() => _PokemonListItemState();
}

class _PokemonListItemState extends State<PokemonListItem> {
  @override
  void initState() {
    print("iniciando widget");
  }

  Widget sizedBox = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Card(
            color: Colors.blue,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Image.network(
                    pokemon_mock_image_url,
                    fit: BoxFit.cover,
                  ),
                  sizedBox,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2)),
                    width: 30,
                    height: 35,
                    child: const Center(
                      child: Text(
                        "#1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  sizedBox,
                  const Text(
                    "Bulbasaur",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  sizedBox,
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Detalhes",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
