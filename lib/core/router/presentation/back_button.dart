import 'package:flutter/cupertino.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class RouteBackButton extends StatelessWidget {
  const RouteBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () => context.beamBack(),
    );
  }
}