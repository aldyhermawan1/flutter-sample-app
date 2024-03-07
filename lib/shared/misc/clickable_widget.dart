import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {
  const ClickableWidget({
    required this.child,
    super.key,
    this.height,
    this.width,
    this.decoration,
    this.onTap,
    this.shapeBorder,
    this.borderRadius,
  });

  final double? height;
  final double? width;
  final Decoration? decoration;
  final void Function()? onTap;
  final Widget child;
  final ShapeBorder? shapeBorder;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: height,
        width: width,
        decoration: decoration,
        child: InkWell(
          customBorder: shapeBorder,
          borderRadius: borderRadius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
