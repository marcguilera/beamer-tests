import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'section.dart';

class SectionController extends StateNotifier<Sections> {
  SectionController(Sections state) : super(state);

  void setIndex(int index) {
    state = state.copyWith(index: index);
  }
}