import 'package:flutter/material.dart';
import 'package:hive_project/constants/style.dart';

class CHeader extends StatelessWidget {
  const CHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 80,
      expandedHeight: 300,
      centerTitle: true,
      backgroundColor: Style.PRIMARY,
      flexibleSpace: Center(
        // Header title
        child: Text(
          title,
          style: Style.TEXT_LG_300_WHITE,
        ),
      ),
    );
  }
}
