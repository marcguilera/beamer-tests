import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_ago.freezed.dart';

@freezed
class TimeAgo with _$TimeAgo {
  const factory TimeAgo({
    required DateTime timestamp,
    @Default(Duration(seconds: 10))
    Duration rate,
    @Default(false)
    bool short,
    @Default(true)
    bool allowFromNow
  }) = _TimeAgo;
}