import 'package:beamer/beamer.dart';
import 'package:cronicadeportiva/core/common/common.dart';
import 'package:flutter/material.dart';

class BeamerLogger {
  static final _logger = Logging.named('router');

  const BeamerLogger();

  void onNavigate(RouteInformation info, BeamerDelegate delegate) {
    _logger.fine('navigate to: ${info.location}');
  }
}