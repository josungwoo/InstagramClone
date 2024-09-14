import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/components/renderPost.dart';
import 'package:instagram_clone/components/renderProfile.dart';
import 'package:instagram_clone/model/postModel.dart';
import 'package:instagram_clone/screen/mainPage/cameraPage.dart';
import 'package:instagram_clone/screen/mainPage/dmPage.dart';
import 'package:instagram_clone/screen/mainPage/postPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController scrollController;
  //  = ScrollController();
  late final IndexController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    pageController = IndexController();
  }

  @override
  Widget build(BuildContext context) {
    final List<StatelessWidget> pageList = [
      CameraPage(),
      MainPage(
        storyBuilder: (context, index) {
          // always need to show 0 index page as mystory
          if (index == 0) {
            return renderProrile(
              name: 'your story',
              thickness: 100,
              index: index,
              imageSrc: 'assets/img/love.png',
              story: false,
            );
          }
          // else another index stories are depends
          return renderProrile(
            thickness: 100,
            imageSrc: 'assets/img/test.png',
            index: index,
            story: true,
            name: 'test',
          );
        },
        postBuilder: (context, index) {
          final postData = postsDatas[index];
          return Builder(
              builder: (context) => renderPost(
                  context: context,
                  frameType: postData.frameType,
                  index: index,
                  name: postData.name,
                  imageSrc: postData.imageSrc));
        },
        scrollController: scrollController,
        postDatas: postsDatas,
      ),
      DmPage(),
    ];

    return SafeArea(
      child: TransformerPageView(
        // curve: Easing.emphasizedAccelerate,
        index: 1, // initianal page index
        physics: ClampingScrollPhysics(),
        onPageChanged: (value) {},
        controller: pageController,
        itemCount: pageList.length,
        itemBuilder: (context, index) => pageList[index],
      ),
    );
  }
}
