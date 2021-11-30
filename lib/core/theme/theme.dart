import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ThemeProviders {
  static final mode = Provider.autoDispose((_) {
    return ThemeMode.light;
  });
  static final light = Provider.autoDispose((_) {
    return ThemeData.light();
  });
  static final dark = Provider.autoDispose((_) {
    return ThemeData.light();
  });
}