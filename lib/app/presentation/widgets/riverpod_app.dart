import 'package:cronicadeportiva/core/l10n/l10n.dart';
import 'package:cronicadeportiva/core/router/router.dart';
import 'package:cronicadeportiva/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodApp extends ConsumerWidget {
  const RiverpodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerDelegate: ref.watch(RouterProviders.delegate),
      routeInformationParser: ref.watch(RouterProviders.parser),
      backButtonDispatcher: ref.watch(RouterProviders.backButton),
      locale: ref.watch(L10nProviders.locale),
      supportedLocales: ref.watch(L10nProviders.supportedLocales),
      localizationsDelegates: ref.watch(L10nProviders.delegates),
      theme: ref.watch(ThemeProviders.light),
      darkTheme: ref.watch(ThemeProviders.dark)
    );
  }
}