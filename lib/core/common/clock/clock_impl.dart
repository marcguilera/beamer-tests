import 'clock.dart';

class ClockImpl implements Clock {
  static const I = ClockImpl();
  const ClockImpl();

  @override
  DateTime now() => DateTime.now();
}