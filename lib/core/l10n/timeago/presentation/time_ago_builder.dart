import 'package:cronicadeportiva/core/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef TimeAgoBuilderFunc = Widget Function(String formatted);

class TimeAgoBuilder extends ConsumerWidget {

  final TimeAgo timeAgo;
  final TimeAgoBuilderFunc builder;

  const TimeAgoBuilder({
    Key? key,
    required this.timeAgo,
    required this.builder
  }) : super(key: key);

  factory TimeAgoBuilder.timestamp({
    Key? key,
    required DateTime timestamp,
    required TimeAgoBuilderFunc builder
  }) => TimeAgoBuilder(
      key: key,
      timeAgo: TimeAgo(timestamp: timestamp),
      builder: builder
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatted = ref.watch(L10nProviders.timeAgo(timeAgo));

    return builder(formatted);
  }
}