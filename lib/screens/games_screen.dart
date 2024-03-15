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
  //List<Game> games = [];

  @override
  void initState() {
    super.initState();
  }

  // void _getGames() async {
  //   games = (await (ApiServices().fetchGames()))!;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Games App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // future builder creates a widget that builds itself based on the latest snapshot, the data came from future parameter.
      body: FutureBuilder<List<Game>>(
        future: ApiServices().fetchGames(),
        builder: (BuildContext context, AsyncSnapshot<List<Game>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GameItem(gameModel: snapshot.data![index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5.0,
                ),
                itemCount: snapshot.data!.length,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

/*
    games.isEmpty
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
 */
