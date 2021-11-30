import 'package:cronicadeportiva/core/env/env.dart';
import 'package:flutter/cupertino.dart';

class AppOverlay extends StatelessWidget {
  final Widget child;

  const AppOverlay({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnvBanner(
      child: child
    );
  }
}