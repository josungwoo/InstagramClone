import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            name!, // post 가 false 일때만 반환하기에 무조건 입력
            style: TextStyle(color: Colors.white),
          )
      ],
    ),
  );
}
