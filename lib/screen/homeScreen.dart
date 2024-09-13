import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/const/const.dart';
import 'package:instagram_clone/model/postModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  print(kToolbarHeight);
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
                                                  size: 28,
                                                  color: Colors.white),
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
                await Future.delayed(Duration(seconds: 3));
                print('object');
              },
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // always need to show 0 index page as mystory
                    if (index == 0) {
                      return renderProrile(
                          thickness: 100,
                          index: index,
                          imageSrc: 'assets/img/love.png',
                          story: false);
                    }
                    // else another index stories are depends
                    return renderProrile(
                        thickness: 100,
                        imageSrc: 'assets/img/test.png',
                        index: index,
                        story: true,
                        name: 'test');
                  },
                ),
              ),
            ),
            SliverList.builder(
              // 임시 데이터 From PostModel
              itemCount: postsDatas.length,
              itemBuilder: (context, index) {
                final postData = postsDatas[index];
                return renderPost(
                    frameType: postData.frameType,
                    index: index,
                    name: postData.name,
                    imageSrc: postData.imageSrc);
              },
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
      ),
    );
  }

  renderProrile({
    int? index,
    bool? isPost,
    String? name,
    required double thickness,
    required bool story,
    required String imageSrc,
  }) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: thickness,
                width: thickness,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: story
                          ? [Colors.yellow, Colors.red, Colors.purple]
                          : [Colors.transparent, Colors.transparent]),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    height: thickness * 0.92,
                    width: thickness * 0.92,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: AssetImage(imageSrc)),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.black,
                            width: thickness * 0.03)),
                  ),
                ),
              ),
              if (index == 0)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Center(
                        child: Icon(
                      CupertinoIcons.add,
                      size: 24,
                      color: Colors.white,
                    )),
                  ),
                )
            ],
          ),
          if (isPost != true)
            SizedBox(
              height: 4,
            ),
          if (isPost != true)
            Text(
              //TODO : 이름 내스토리는 내꺼만 , 다른사람은 해당 사람 이름으로
              name == null ? 'Your story' : name,
              style: TextStyle(color: Colors.white),
            )
        ],
      ),
    );
  }

  renderPost({
    int? index,
    required String frameType,
    required String name,
    required String imageSrc,
  }) {
    final double baseThickness = MediaQuery.of(context).size.width;
    final double wideThickness = baseThickness * 1.25;
    final double shortThickness = baseThickness * 0.52;
    final Map<String, Map<String, double>> frame = {
      "VertivalPortrait": {"height": wideThickness, "width": baseThickness},
      "Square": {"height": baseThickness, "width": baseThickness},
      "LandScapeHorizontal": {"height": shortThickness, "width": baseThickness},
    };

    return Container(
      color: Colors.black,
      // height: 400,
      child: Column(
        children: [
          Row(
            children: [
              renderProrile(
                thickness: 45,
                story: true,
                imageSrc: 'assets/img/test.png',
                isPost: true,
              ),
              Text('$name'),
              Expanded(child: SizedBox()),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
            ],
          ),
          Container(
            height: frame[frameType]!["height"],
            width: frame[frameType]!["width"],
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageSrc),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.heart,
                  )),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.chat_bubble)),
              IconButton(
                  onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
              Expanded(child: SizedBox()),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bookmark)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Likes by {name} and others'),
                Text('captions'),
                Text('View all comments'),
                Text('{dates} days ago'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
