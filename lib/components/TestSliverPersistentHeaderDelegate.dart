import 'package:flutter/material.dart';

class TestSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  TestSliverPersistentHeaderDelegate(this.widget);

  final Widget widget;

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 16.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  bool shouldRebuild(TestSliverPersistentHeaderDelegate oldDelegate) => false;
}