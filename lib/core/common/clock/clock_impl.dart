import 'clock.dart';

class ClockImpl implements Clock {
  const ClockImpl();

  @override
  DateTime now() => DateTime.now();
}