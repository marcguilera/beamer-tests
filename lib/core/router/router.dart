export 'presentation/back_button.dart';

import 'package:beamer/beamer.dart';
import 'package:cronicadeportiva/features/home/home.dart';
import 'package:cronicadeportiva/features/settings/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'logic/beamer_logger.dart';

class RouterProviders {
  static final builder = Provider<LocationBuilder>((ref) {
    return BeamerLocationBuilder(
      beamLocations: [
        ref.read(HomeProviders.location),
        ref.read(SettingsProviders.location)
      ]
    );
  });

  static final delegate = Provider((ref) {
    Beamer.setPathUrlStrategy();

    const logger = BeamerLogger();
    return BeamerDelegate(
      initialPath: HomeLocation.home,
      routeListener: logger.onNavigate,
      locationBuilder: ref.read(builder)
    );
  });

  static final parser = Provider((_) {
    return BeamerParser();
  });

  static final backButton = Provider((ref) {
    return BeamerBackButtonDispatcher(
      delegate: ref.read(delegate)
    );
  });
}