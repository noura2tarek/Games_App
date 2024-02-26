import 'package:flutter/material.dart';
import 'package:games_app/screens/games_screen.dart';
import 'package:games_app/services/game_services.dart';

void main() async{
  await ApiServices().fetchGames();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamesScreen(),
    );
  }
}
