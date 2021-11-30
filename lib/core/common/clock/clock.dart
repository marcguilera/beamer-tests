abstract class Clock {
  DateTime now();
}

extension ClockExt on Clock {
  DateTime nowUTC() => now().toUtc();
}