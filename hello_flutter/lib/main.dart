import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Scaffold : 화면에 보여줄 첫번째 위젯
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "hello my flutter",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          // 스크롤 뷰
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              // 위젯 세로 정렬
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.network(
                      "https://i.ibb.co/CwzHq4z/trans-logo-512.png",
                      width: 81),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Account'),
                ),
                TextField(
                  obscureText: true, // 패스워드 암호화
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: Text('login'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
