import 'package:cronicadeportiva/core/l10n/l10n.dart';
import 'package:cronicadeportiva/features/home/home.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class BottomMenu extends ConsumerWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(L10nProviders.strings);
    final sections = ref.watch(HomeProviders.sections);
    final notifier = ref.read(HomeProviders.sections.notifier);

    BottomNavigationBarItem _toItem(Section section) {
      final tuple = section.when(
        home: (_) => Tuple2(Icons.home, strings.home_title),
        search: (_) => Tuple2(Icons.search, strings.search_title),
        bookmarks: (_) => Tuple2(Icons.bookmarks, strings.bookmark_title),
        profile: (_) => Tuple2(Icons.person, strings.profile_title)
      );

      return BottomNavigationBarItem(
        icon: Icon(tuple.value1),
        tooltip: tuple.value2,
        label: tuple.value2
      );
    }

    return SnakeNavigationBar.color(
        currentIndex: sections.index,
        onTap: notifier.setIndex,
        items: sections.sections.map(_toItem).toList()
    );
  }
}