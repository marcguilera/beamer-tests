import 'package:cronicadeportiva/app/presentation/widgets/app_overlay.dart';
import 'package:cronicadeportiva/app/presentation/widgets/riverpod_app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_context/riverpod_context.dart';

import 'app_overlay.dart';

class App extends StatelessWidget {
  final List<Override> overrides;

  const App({
    Key? key,
    this.overrides = const []
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides,
      child: const InheritedConsumer(
        child: AppOverlay(
          child: RiverpodApp()
        )
      ),
    );
  }
}