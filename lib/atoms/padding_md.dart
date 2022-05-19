import 'package:flutter/material.dart';
import 'package:hive_project/constants/style.dart';

class PaddingMd extends StatelessWidget {
  const PaddingMd({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Style.GAP_MD),
      child: child,
    );
  }
}
