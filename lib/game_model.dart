import 'package:zugclient/zug_area.dart';
import 'package:zugclient/zug_model.dart';
import 'game.dart';

enum GameMsg { gameWin, gameLose, top, scoreRank }

class GameModel extends ZugModel {

  Game get currentGame => currentArea as Game;

  Game getGame(data) => getOrCreateArea(data) as Game;

  GameModel(super.domain, super.port, super.remoteEndpoint, super.prefs, {super.localServer,super.showServMess,super.javalinServer}) {
    showServMess = true;
    modelName = "my_client";
    addFunctions({
      GameMsg.gameWin: handleVictory,
      GameMsg.gameLose: handleDefeat,
      GameMsg.top: handleTop,
      GameMsg.scoreRank: handleScoreRank,
    });
    editOption(AudioOpt.music, true);
    checkRedirect("lichess.org");
  }

  Future<void> handleVictory(data) async {
    handleUpdateArea(data); //playClip("victory");

  }

  Future<void> handleDefeat(data) async {
    handleUpdateArea(data); //playClip("defeat");
  }

  void handleTop(data) {
    //TopDialog(zugAppNavigatorKey.currentContext!,data["scores"] as List<dynamic>).raise();
  }

  void handleScoreRank(data) {
    //InfoDialog(zugAppNavigatorKey.currentContext!, "Your score ranks ${getPlace(data["rank"])} (out of ${data["scores"]})").raise();
  }

  @override
  Area createArea(data) {
    return Game(data);
  }

}