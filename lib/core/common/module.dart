import 'package:flutter_modular/flutter_modular.dart';

import 'clock/clock_impl.dart';
import 'common.dart';

class CommonModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.instance<Clock>(ClockImpl.I, export: true)
  ];
}