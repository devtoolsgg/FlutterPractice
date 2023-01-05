import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl; // 이미지를 담을 변수

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  // 좋아요 클릭 상태
  bool isHeart = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지
        Image.network(
          widget.imageUrl, // 위젯 내 선언된 변수
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover, // 비율 유지하면서 적절히 크롭해 보여준다
        ),

        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isHeart = !isHeart; // bool 값 반대의 재할당
                });
              },
              icon: Icon(
                CupertinoIcons.heart,
                color: isHeart ? Colors.red : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.black,
              ),
            ),
            Spacer(), // 가능한 만큼 공백을 만들어주는 것
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bookmark,
                color: Colors.black,
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '2 likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '내 고양이가 목욕중입니다. 주변에 러버덕들이 엄청 많네요 ㅎㅎ',
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '2월 6일',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
