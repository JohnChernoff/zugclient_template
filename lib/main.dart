import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:zug_utils/zug_utils.dart';
import 'package:zugclient/zug_app.dart';
import 'package:zugclient/zug_model.dart';
import 'game_model.dart';
import 'game_page.dart';

//TODO: game timer is a bit annoying

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  String appName = "Roshambo 9000";
  ZugUtils.getIniDefaults("chuck.ini").then((defaults) {
    ZugUtils.getPrefs().then((prefs) {
      String domain = defaults["domain"] ?? "localhost";
      int port = int.parse(defaults["port"] ?? "4444");
      String endPoint = defaults["endpoint"] ?? "ws";
      bool localServer = bool.parse(defaults["localServer"] ?? "true");
      log("Starting $appName Client, domain: $domain, port: $port, endpoint: $endPoint, localServer: $localServer");
      GameModel model = GameModel(domain,port,endPoint,prefs,localServer : localServer,showServMess : false, javalinServer: true);
      runApp(GameApp(model,appName));
    });
  });
}

class GameApp extends ZugApp {
  GameApp(super.client, super.appName,
      {super.key, super.logLevel = Level.INFO, super.noNav = true});

  @override
  AppBar createAppBar(BuildContext context, ZugModel model,
      {Widget? txt, Color? color}) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
          "Welcome to $appName, ${model.userName?.name ?? "Unknown User"}! ",
          style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget createMainPage(model) {
    return GamePage(model as GameModel);
  }
}
