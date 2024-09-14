import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final NullableIndexedWidgetBuilder storyBuilder;
  final NullableIndexedWidgetBuilder postBuilder;
  final ScrollController scrollController;
  final List postDatas;

  const MainPage({
    super.key,
    required this.storyBuilder,
    required this.postBuilder,
    required this.scrollController,
    required this.postDatas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          // AppBar
          SliverAppBar(
            floating: true,
            snap: true,
            toolbarHeight: 60,
            backgroundColor: Colors.black,
            centerTitle: false,

            // Instagram Logo Button
            title: GestureDetector(
              onTap: () {
                final double width = 100;

                showDialog(
                  barrierDismissible: true,
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.transparent,
                    actionsPadding: EdgeInsets.zero,
                    insetPadding: EdgeInsets.only(
                        top: kToolbarHeight +
                            MediaQuery.of(context).padding.top),
                    alignment: Alignment(-1, -1),
                    actions: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: UnconstrainedBox(
                              child: Container(
                                  margin: EdgeInsets.zero,
                                  padding: EdgeInsets.zero,
                                  // width: width,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.grey[800]!.withOpacity(0.6)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 30),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(CupertinoIcons.person_2,
                                                size: 28, color: Colors.white),
                                            SizedBox(width: 24),
                                            Text('Following',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 36,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons.star,
                                              size: 28,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 24),
                                            Text('Favorates',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    'Instagram',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.white,
                  )
                ],
              ),
            ),

            //Likes and DirectMessage
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.heart,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.paperplane,
                ),
              ),
            ],
          ),

          //Main page
          CupertinoSliverRefreshControl(
            builder: (context, refreshState, pulledExtent,
                refreshTriggerPullDistance, refreshIndicatorExtent) {
              double progress = 0;
              if (refreshState.name == 'drag') {
                // print((scrollController.offset / 100) * -1);
                progress = (scrollController.offset / 100) * -1;
                return SizedBox(
                  child: Center(
                    child: CupertinoActivityIndicator.partiallyRevealed(
                      progress: progress,
                      radius: 15,
                      color: Colors.white,
                    ),
                  ),
                );
              }
              return SizedBox(
                child: Center(
                  child: CupertinoActivityIndicator(
                    radius: 15,
                    color: Colors.white,
                  ),
                ),
              );
            },
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 1));
              print('object');
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: storyBuilder,
              ),
            ),
          ),
          SliverList.builder(
            // 임시 데이터 From PostModel
            itemCount: postDatas.length,
            itemBuilder: postBuilder,
          )
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: 0,
        onTap: (value) {},
        activeColor: Colors.white,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_app),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.play_rectangle),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
