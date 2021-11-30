import 'package:cronicadeportiva/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sections/home.dart';
import 'sections/search.dart';
import 'sections/bookmarks.dart';
import 'sections/profile.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = ref.watch(HomeProviders.sections);

    Widget _toWidget(Section section) {
      return section.when(
        home: (_) => const Home(),
        search: (_) => const Search(),
        bookmarks: (_) => const Bookmarks(),
        profile: (_) => const Profile()
      );
    }

    return IndexedStack(
      index: sections.index,
      children: sections.sections.map(_toWidget).toList()
    );
  }
}