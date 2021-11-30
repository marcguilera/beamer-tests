import 'package:cronicadeportiva/core/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvBanner extends ConsumerWidget {
  final Widget child;

  const EnvBanner({Key? key, required this.child}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final env = ref.watch(EnvProviders.env);

    if (!env.isTest) {
      return child;
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        location: BannerLocation.bottomStart,
        color: Colors.purple,
        message: env.name.toUpperCase(),
        child: child,
      )
    );
  }
}