import 'package:instagram_clone/const/const.dart';

class PostModel {
  final String frameType;
  final String name;
  final String imageSrc;
  final int likes = 0;
  final int comments = 0;

  PostModel({
    required this.frameType,
    required this.name,
    required this.imageSrc,
  });
}

final List<PostModel> postsDatas = [
  PostModel(
      frameType: PostImageFrame.VertivalPortrait.name,
      name: 'TestUser1',
      imageSrc: 'assets/img/test.png'),
  PostModel(
      frameType: PostImageFrame.LandScapeHorizontal.name,
      name: 'TestUser2',
      imageSrc: 'assets/img/love.png'),
  PostModel(
      frameType: PostImageFrame.Square.name,
      name: 'TestUser3',
      imageSrc: 'assets/img/bebek.png'),
  PostModel(
      frameType: PostImageFrame.VertivalPortrait.name,
      name: 'TestUser4',
      imageSrc: 'assets/img/test.png'),
];
