export 'clock/clock.dart';
export 'logger/logging.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger/logging.dart';
import 'clock/clock.dart';
import 'clock/clock_impl.dart';

class CommonProviders {
  CommonProviders._();

  static final logs = StreamProvider.autoDispose((_) {
    return Logging.onRecord;
  });

  static final clock = Provider<Clock>((_) {
    return const ClockImpl();
  });

  static final periodic = ChangeNotifierProvider.autoDispose.family((ref, Duration period) {
    final notifier = ValueNotifier(-1);
    final subscription = Stream.periodic(period, id).listen((event) => notifier.value = event);
    ref.onDispose(subscription.cancel);
    return notifier;
  });
}

extension AutoDisposeRefTimerExt on AutoDisposeRef {
  void rebuildEvery(Duration duration) => watch(CommonProviders.periodic(duration));
}