import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChromeScope extends StatelessWidget {
  const ChromeScope({
    super.key,
    required this.top,
    required this.bottom,
    required this.child,
  });

  final Color top;
  final Color bottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: top,
        systemNavigationBarColor: bottom,
        statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: ColoredBox(color: top, child: child),
    );
  }
}
