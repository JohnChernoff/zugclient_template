import 'package:zugclient/zug_area.dart';
import 'game_model.dart';

class Game extends Area {
  Game(super.data);

  void update(dynamic data,GameModel? model) {
    //TODO: add stuff here
  }

  @override
  List<Enum> getPhases() {
    return ZugPhase.values;
  }

}