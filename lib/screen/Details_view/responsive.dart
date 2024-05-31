import 'package:flutter/cupertino.dart';

class ResponsiveDetails extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  const ResponsiveDetails({
    Key? key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return desktop;
        } else if (constraints.maxWidth >= 1000) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
