import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'createPage.dart';

class Bucket {
  // 멤버변수
  String job;
  bool isDone;

  Bucket(this.job, this.isDone); // 생성자
}

/// 홈 페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bucket> bucketList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버킷 리스트"),
      ),
      body: bucketList.isEmpty
          ? Center(child: Text("버킷 리스트를 작성해 주세요."))
          : ListView.builder(
              itemCount: bucketList.length,
              itemBuilder: (context, index) {
                Bucket bucket = bucketList[index];
                int count = index + 1;

                return ListTile(
                  title: Text(
                    bucket.job,
                    style: TextStyle(
                      fontSize: 20,
                      color: bucket.isDone ? Colors.grey : Colors.black,
                      decoration: bucket.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text('$count 번째 할일'),
                  trailing: IconButton(
                    onPressed: () {
                      // 다이얼로그 생성
                      showDeleteDialog(context, bucket);
                    },
                    icon: Icon(CupertinoIcons.delete),
                  ),
                  onTap: () {
                    print('$bucket : 아이템 탭');

                    setState(() {
                      bucket.isDone = !bucket.isDone;
                    });
                  },
                );
              }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // + 버튼 클릭시 버킷 생성 페이지로 이동

          String? job = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreatePage()),
          );

          if (job != null) {
            setState(() {
              Bucket newBucket = Bucket(job, false);
              bucketList.add(newBucket);
            });
          }
        },
      ),
    );
  }

  // 소스 분리
  void showDeleteDialog(BuildContext context, Bucket bucket) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('삭제하시겠습니까?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('취소')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    bucketList.remove(bucket);
                  });
                },
                child: Text(
                  '확인',
                  style: TextStyle(color: Colors.pink),
                ))
          ],
        );
      },
    );
  }
}
