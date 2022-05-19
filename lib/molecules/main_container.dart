import 'package:flutter/material.dart';
import 'package:hive_project/atoms/header.dart';
import 'package:hive_project/constants/style.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            CHeader(title: title),

            // Body
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) {
                  return Padding(
                    padding: Style.PADDING_MD,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      // Content
                      children: children,
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
