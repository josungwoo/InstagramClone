import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/components/renderProfile.dart';

renderPost({
  int? index,
  required context,
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
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.paperplane)),
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
