export 'presentation/location.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/location.dart';

class SettingsProviders {
  SettingsProviders._();

  static final location = Provider((ref) {
    return SettingsLocation(ref);
  });
}