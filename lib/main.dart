import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:zug_utils/zug_utils.dart';
import 'package:zugclient/zug_app.dart';
import 'package:zugclient/zug_client.dart';
import 'game_client.dart';
import 'game_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  String appName = "GameApp";
  ZugUtils.getIniDefaults("defaults.ini").then((defaults) {
    ZugUtils.getPrefs().then((prefs) {
      String domain = defaults["domain"] ?? "mygame.com";
      int port = int.parse(defaults["port"] ?? "1234");
      String endPoint = defaults["endpoint"] ?? "mygame";
      bool localServer = bool.parse(defaults["localServer"] ?? "true");
      log("Starting $appName Client, domain: $domain, port: $port, endpoint: $endPoint, localServer: $localServer");
      GameClient client = GameClient(domain,port,endPoint,prefs,localServer : localServer);
      runApp(GameApp(client,appName));
    });
  });
}

class GameApp extends ZugApp {
  GameApp(super.client, super.appName,
      {super.key, super.logLevel = Level.INFO, super.noNav = true});

  @override
  AppBar createAppBar(BuildContext context, ZugClient client,
      {Widget? txt, Color? color}) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
          "Welcome to $appName, ${client.userName?.name ?? "Unknown User"}! ",
          style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget createMainPage(client) {
    return GamePage(client);
  }
}
