import 'package:flutter/material.dart';

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({required this.size, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
