import 'dart:ui';

import 'package:cronicadeportiva/core/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as ago;

class TimeAgoFormatter {
  static const _short = '_short';

  final Clock clock;

  TimeAgoFormatter({
    required this.clock
  }) {
    _init();
  }

  String format(DateTime time, Locale locale, {
    bool short = false,
    bool allowFromNow = true
  }) => ago.format(
      time.toLocal(),
      clock: clock.now(),
      allowFromNow: allowFromNow,
      locale: _resolveLocale(locale, short)
  );

  String _resolveLocale(Locale locale, bool short) {
    final languageCode = locale.languageCode;
    return short ? languageCode : languageCode + _short;
  }

  static final _messages = {
    'es' : ago.EsMessages(),
    'es' + _short : ago.EsShortMessages(),
    'ca' : ago.CaMessages(),
    'ca' + _short : ago.CaShortMessages()
  };

  static void _init() {
    _messages.forEach((key, value) => ago.setLocaleMessages(key, value));
  }
}