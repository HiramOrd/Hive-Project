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
      expandedHeight: 300,
      centerTitle: true,
      backgroundColor: Style.PRIMARY,
      flexibleSpace: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: Style.TEXT_LG,
          ),
        ),
      ),
      // pinned: true,
      // collapsedHeight: 80,
    );
  }
}
