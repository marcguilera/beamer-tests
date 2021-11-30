export 'presentation/location.dart';
export 'presentation/screens/home/logic/section.dart';
export 'presentation/screens/home/logic/section_controller.dart';

import 'dart:math';

import 'package:cronicadeportiva/core/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/location.dart';
import 'presentation/screens/home/logic/section.dart';
import 'presentation/screens/home/logic/section_controller.dart';

class HomeProviders {
  static final location = Provider((_) {
    return HomeLocation();
  });

  static final sections = StateNotifierProvider.autoDispose<SectionController, Sections>((ref) {
    ref.maintainState = true;

    final beamer = ref.read(RouterProviders.delegate);
    final location = beamer.currentBeamLocation.state.routeInformation.location;
    final index = Section.values.indexWhere((element) => element.path == location);
    final initial = Sections(index: max(0, index), sections: Section.values);
    return SectionController(initial);
  });
}