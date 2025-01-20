import 'package:flutter/cupertino.dart';
import 'package:zugclient_template/game_client.dart';

class GamePage extends StatefulWidget {

  final GameClient client;
  const GamePage(this.client, {super.key});

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