export 'package:flutter_gen/gen_l10n/strings.dart';
export 'timeago/logic/time_ago_formatter.dart';
export 'timeago/logic/time_ago.dart';
export 'timeago/presentation/time_ago_builder.dart';
export 'localization/presentation/l10n_builder.dart';

import 'package:cronicadeportiva/core/common/common.dart';
import 'package:flutter_gen/gen_l10n/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'timeago/logic/time_ago_formatter.dart';
import 'timeago/logic/time_ago.dart';

class L10nProviders {
  L10nProviders._();

  static final supportedLocales = Provider((_) {
    return AppLocalizations.supportedLocales;
  });

  static final delegates = Provider((_) {
    return AppLocalizations.localizationsDelegates;
  });

  static final defaultLocale = Provider((ref) {
    final supported = ref.read(supportedLocales);
    return supported.first;
  });

  static final locale = Provider((ref) {
    return ref.read(defaultLocale);
  });

  static final strings = Provider.autoDispose((ref) {
    final currentLocale = ref.watch(locale);

    return lookupAppLocalizations(currentLocale);
  });

  static final timeAgoFormatter = Provider((ref) {
    return TimeAgoFormatter(clock: ref.read(CommonProviders.clock));
  });

  static final timeAgo = Provider.autoDispose.family((ref, TimeAgo time) {
    ref.rebuildEvery(time.rate);

    final formatter = ref.read(timeAgoFormatter);
    final currentLocale = ref.watch(locale);

    return formatter.format(time.timestamp, currentLocale, allowFromNow: time.allowFromNow, short: time.short);
  });
}