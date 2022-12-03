import 'package:etherwallet/components/TestSliverPersistentHeaderDelegate.dart';
import 'package:etherwallet/utils/resource_mananger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class MarketPage extends HookWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scroller = useScrollController();
    final tabController = useTabController(initialLength: 2);
    late PointerDownEvent downEvent;
    final toolBar = ToolbarProvider();
    useEffect(() {
      scroller.addListener(() {
        // print(scroller.offset);
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
                scroller.animateTo(0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              }
            }
          },
          onPointerDown: (event) {
            downEvent = event;
          },
          child: NestedScrollView(
            controller: scroller,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    backgroundColor: Colors.white,
                    floating: true,
                    stretch: true,
                    pinned: true,
                    expandedHeight: 300,
                    leading: Consumer<ToolbarProvider>(
                      builder: (context, status, builder) {
                        return status.value == true
                            ? Image.asset(ImageHelper.wrapAssetsPng('eye'))
                            : const Text('');
                      },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('DEMO'),
                      centerTitle: true,
                      collapseMode: CollapseMode.none,
                      background: Image.network(
                        'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                      stretchModes: [StretchMode.zoomBackground],
                    ),
                    forceElevated: innerBoxIsScrolled,
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: Consumer<ToolbarProvider>(
                //     builder: (context, status, builder) {
                //       return Container(
                //         width: MediaQuery.of(context).size.width,
                //         height: 50,
                //         color: Colors.red,
                //         child: Text('aaaaaaaaaaaaaaaaaaaaaaaa'),
                //       );
                //     },
                //   ),
                // ),
                // SliverPersistentHeader(
                //   pinned: true,
                //   delegate: SliverHeaderDelegate.fixedRange(
                //     //固定高度
                //     mHeight: 0,
                //     height: 50,
                //     child: Consumer<ToolbarProvider>(
                //       builder: (context, status, builder) {
                //         return Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: 0,
                //           color: Colors.red,
                //           child: Text('aaaaaaaaaaaaaaaaaaaaaaaa'),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverHeaderDelegate.fixedHeight(
                    //固定高度
                    height: 0,
                    child: buildHeader(1),
                  ),
                ),

                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverHeaderDelegate.fixedHeight(
                    //固定高度
                    height: 50,
                    child: buildHeader(2),
                  ),
                ),

              ];
            },
            body: Container(
              color: Colors.cyan,
              child: Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverToBoxAdapter(child: Container(height: 50,color: Colors.red,),),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeaderDelegate.fixedHeight(
                        //固定高度
                        height: 50,
                        child: buildHeader(3),
                      ),
                    ),
                    buildSliverList(23)
                  ],
                );
              }),
            ),
          ),
        ),
      ),
      create: (_) => toolBar,
    );
  }

  // 构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
              title: GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(msg: index.toString());
                  },
                  child: Container(color: Colors.cyan, child: Text('$index'))));
        },
        childCount: count,
      ),
    );
  }
}

class ToolbarProvider with ChangeNotifier {
  double minContentHeight = 0;
  double maxContentHeight = 112;

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
    if (scrollController.offset > 132 && scrollController.offset <= 244) {
      contentHeight = (scrollController.offset - 132) * 0.5;
    } else {
      if (show) {
        contentHeight = 56;
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
    print('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
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
