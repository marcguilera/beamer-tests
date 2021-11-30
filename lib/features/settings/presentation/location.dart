import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/settings/settings_screen.dart';

class SettingsLocation extends BeamLocation<BeamState> {
  static const settings = '/settings';

  SettingsLocation(this.ref);

  @override
  List<Pattern> get pathPatterns => [settings];

  final ProviderRef ref;

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey(settings),
        child: SettingsScreen()
      )
    ];
  }
}