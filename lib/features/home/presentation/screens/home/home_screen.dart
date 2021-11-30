import 'package:cronicadeportiva/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'widgets/home_body.dart';
import 'widgets/bottom_menu.dart';

class HomeScreen extends ConsumerWidget {
  static final _path = HomeProviders.sections.select((s) => s.section.path);
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(_path, (_, String next) => _update(context, next));

    return const Scaffold(
      body: HomeBody(),
      bottomNavigationBar: BottomMenu()
    );
  }

  static void _update(BuildContext context, String path) {
    Beamer.of(context).update(
      configuration: RouteInformation(
        location: path
      )
    );
  }
}