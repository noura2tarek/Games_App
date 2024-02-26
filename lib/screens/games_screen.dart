import 'package:flutter/material.dart';
import 'package:games_app/screens/widgets/game_item.dart';
import 'package:games_app/services/game_services.dart';

import '../models/game_model.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  List<Game> games = [];

  @override
  void initState() {
    _getGames();
    super.initState();
  }

  void _getGames() async {
    games = (await (ApiServices().fetchGames()))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          "Games App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: games.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GameItem(
                    gameModel: games[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: games.length,
              ),
            ),
    );
  }
}
