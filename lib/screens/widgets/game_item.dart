import 'package:flutter/material.dart';
import '../../models/game_model.dart';

class GameItem extends StatelessWidget {
  const GameItem({Key? key, required this.gameModel}) : super(key: key);
  final Game gameModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 15.0,
      shadowColor: Colors.white24,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(gameModel.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              gameModel.title,
              style: const TextStyle(fontSize: 19.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 8.0, left: 8.0, bottom: 8.0),
            child: Text(
              'Description:\n${gameModel.shortDescription}',
              style: const TextStyle(fontSize: 13.0),
            ),
          ),
        ],
      ),
    );
  }
}
