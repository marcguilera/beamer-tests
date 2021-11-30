import 'package:cronicadeportiva/core/env/env.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/app.dart';

class AppFactory {
  final Env env;

  const AppFactory._(this.env);

  static Future<Widget> createApp(Env env) {
    return Future(AppFactory._(env));
  }

  Future<Widget> call() async {
    final overrides = await _overrides().flatMap(id).toList();
    return App(overrides: overrides);
  }

  Stream<Stream<Override>> _overrides() async* {
    yield EnvProviders.overrides(env: env);
  }
}