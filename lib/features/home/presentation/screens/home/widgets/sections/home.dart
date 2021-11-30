import 'package:cronicadeportiva/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(L10nProviders.strings);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.home_title),
      ),
    );
  }
}