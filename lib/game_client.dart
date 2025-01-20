import 'package:zugclient/zug_client.dart';
import 'game.dart';

enum GameMsg { gameWin, gameLose, top, scoreRank }

class GameClient extends ZugClient {

  Game get currentGame => currentArea as Game;

  GameClient(super.domain, super.port, super.remoteEndpoint, super.prefs, {super.localServer}) {
    showServMess = true;
    clientName = "my_client";
    addFunctions({
      GameMsg.gameWin: handleVictory,
      GameMsg.gameLose: handleDefeat,
      GameMsg.top: handleTop,
      GameMsg.scoreRank: handleScoreRank,
    });
    if (prefs?.getBool(AudioType.sound.name) == null) {
      prefs?.setBool(AudioType.sound.name, true);
    }
    checkRedirect("lichess.org");
  }

  Future<void> handleVictory(data) async {
    handleUpdateArea(data);
    playClip("victory");

  }

  Future<void> handleDefeat(data) async {
    handleUpdateArea(data);
    playClip("defeat");
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