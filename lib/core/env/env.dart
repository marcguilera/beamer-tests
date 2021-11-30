import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/env.dart';

export 'presentation/env_banner.dart';
export 'models/env.dart';

class EnvProviders {
  EnvProviders._();

  static final env = Provider.autoDispose((_) {
    return Env.mock;
  });

  static Stream<Override> overrides({Env? env}) async* {
    if (env != null) {
      yield EnvProviders.env.overrideWithValue(env);
    }
  }
}