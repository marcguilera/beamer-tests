import 'package:cronicadeportiva/core/l10n/l10n.dart';
import 'package:cronicadeportiva/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(L10nProviders.strings);

    return Scaffold(
      appBar: AppBar(
        leading: const RouteBackButton(),
        title: Text(strings.settings_title),
      ),
    );
  }

}