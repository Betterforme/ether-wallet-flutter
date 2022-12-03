import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../utils/resource_mananger.dart';

class DAppPage extends HookWidget {
  const DAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scroller = useScrollController();
    final tabController = useTabController(initialLength: 2);
    late PointerDownEvent downEvent;
    final toolBar = ToolbarProvider();
    useEffect(() {
      scroller.addListener(() {
        print(scroller.offset);
        toolBar.setShow(scroller.offset + kToolbarHeight >= 300);
        toolBar.setHeight(scroller);
      });
    }, []);
    return ChangeNotifierProvider<ToolbarProvider>(
      builder: (context, child) => Scaffold(
        body: Listener(
            onPointerUp: (event) {
              print(
                  'down-------------------------------------------------------${downEvent.position}');
              print(
                  'up-------------------------------------------------------${event.position}');

              //防抖
              if ((event.position.dy - downEvent.position.dy).abs() < 5) {
                return;
              }

              if (event.position.dy - downEvent.position.dy < 0) {
                if (toolBar.value) return;

                print(
                    '向上滑动-------------------------------------------------------${toolBar.value} ${event.position}');

                if ((event.position.dy - downEvent.position.dy).abs() > 80) {
                  scroller.animateTo(244,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                } else {
                  scroller.animateTo(0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                }
              } else {
                print(
                    '向下滑动-------------------------------------------------------${event.position}');
                if ((event.position.dy - downEvent.position.dy).abs() < 80) {
                  scroller.animateTo(244,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                } else {
                  if (scroller.offset < 244) {
                    scroller.animateTo(0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  }
                }
              }
            },
            onPointerDown: (event) {
              downEvent = event;
            },
            child: CustomScrollView(controller: scroller, slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                stretch: true,
                pinned: true,
                snap: false,
                expandedHeight: 300,
                leading: Consumer<ToolbarProvider>(
                  builder: (context, status, builder) {
                    return status.value == true
                        ? const Icon(
                            Icons.close,
                            color: Colors.black,
                          )
                        : const Text('');
                  },
                ),
                flexibleSpace: Consumer<ToolbarProvider>(
                    builder: (context, status, builder) {
                  return FlexibleSpaceBar(
                    title: status.show ? const Text('个人资产') : const Text(''),
                    centerTitle: true,
                    collapseMode: CollapseMode.none,
                    background: Image.network(
                      'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                    stretchModes: [StretchMode.zoomBackground],
                  );
                }),
                forceElevated: false,
              ),
              SliverToBoxAdapter(
                child: Consumer<ToolbarProvider>(
                  builder: (context, status, builder) {
                    return Opacity(
                      opacity: status.alpha,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        height: status.contentHeight,
                        color: Colors.lightBlue.shade200,
                        child: Text("总资产\n\n \$100",style: TextStyle(fontSize: 20.w,),),
                      ),
                    );
                  },
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate.fixedHeight(
                  //固定高度
                  height: 50,
                  child: Container(
                      color: Colors.cyan, child: buildHeader(tabController)),
                ),
              ),
              buildSliverList(6),
              const SliverToBoxAdapter(
                child: SizedBox.expand(),
              )
            ])),
      ),
      create: (_) => toolBar,
    );
  }

  // 构建 header
  Widget buildHeader(TabController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: TabBar(
        tabs: const [Text('资产'), Text('NFT'), Text('授权')],
        controller: controller,
        indicatorPadding: EdgeInsets.symmetric(vertical: -8.h),
      ),
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            color: Colors.cyan,
            child: ListTile(
                title: GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(msg: index.toString());
                    },
                    child: Container(color: Colors.cyan, child: Text('$index')))),
          );
        },
        childCount: count,
      ),
    );
  }
}

class ToolbarProvider with ChangeNotifier {
  double minContentHeight = 0;
  double maxContentHeight = 100;
  double alpha = 0;

  bool show = false;
  double contentHeight = 0;

  bool get value => show;

  void setShow(bool show) {
    if (this.show == show) {
      return;
    }
    this.show = show;
    notifyListeners();
  }

  void setHeight(ScrollController scrollController) {
    if (scrollController.offset > 44 && scrollController.offset <= 244) {
      contentHeight = (scrollController.offset - 44) * 0.5;
      alpha = contentHeight/100;
    } else {
      if (show) {
        contentHeight = 100;
      } else {
        contentHeight = 0;
      }
    }
    notifyListeners();
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // child 为 header
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  //最大和最小高度相同
  SliverHeaderDelegate.fixedRange({
    required double mHeight,
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = mHeight;

  //需要自定义builder时使用
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        print('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverHeaderDelegate old) {
    return old.maxExtent != maxExtent || old.minExtent != minExtent;
  }
}
