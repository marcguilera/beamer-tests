import 'dart:async';

import 'package:cronicadeportiva/app/app.dart';
import 'package:cronicadeportiva/core/common/common.dart';
import 'package:cronicadeportiva/core/env/env.dart';
import 'package:flutter/widgets.dart';

class Launcher with Logging {
  final Env env;

  Launcher._(this.env);

  static void launch(Env env) => Launcher._(env).run();

  void run() => runZonedGuarded(_run, (e, st) => logger.severe(e, e, st));

  Future _run() async {
    Logging.init();
    WidgetsFlutterBinding.ensureInitialized();

    logger.info(env);
    logger.info('Creating app');
    final app = await AppFactory.createApp(env);
    logger.info('Running app');
    runApp(app);
  }
}