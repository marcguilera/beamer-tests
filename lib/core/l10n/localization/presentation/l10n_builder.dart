import 'package:cronicadeportiva/core/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef L10nBuilderFunc = Widget Function(AppLocalizations);

class L10nBuilder extends ConsumerWidget {
  final L10nBuilderFunc builder;

  const L10nBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(L10nProviders.strings);
    return builder(strings);
  }
}