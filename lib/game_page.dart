import 'package:flutter/cupertino.dart';

import 'game_model.dart';

class GamePage extends StatefulWidget {

  final GameModel model;
  const GamePage(this.model, {super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text("Implement me!");
  }

}