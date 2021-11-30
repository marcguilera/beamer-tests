import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'screens/home/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  static const home = '/home';
  static const search = home + '/search';
  static const bookmarks = home + '/bookmarks';
  static const profile = home + '/profile';

  @override
  List<Pattern> get pathPatterns => ['*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return const [
      BeamPage(
        key: ValueKey('home'),
        child: HomeScreen()
      )
    ];
  }
}