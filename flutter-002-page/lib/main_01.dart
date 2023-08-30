import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My App",
          ),
        ),

        /// ListView 이미지 넣었을때 양쪽으로 꽉차게, 그리고 내용이 많을경우 아래로 스크롤
        body: ListView(
          children: [
            Image.asset(
              "images/title_image.jpg",
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  /// 컨테이너 위젯
  /// Container : padding, margin 을 부여하는 box
  /// Expanded : 부모 box 를 가득 채우는 구조의 box
  /// Padding : padding 을 기본값으로 갖는 box

  /// Widget 변수 선언하기
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "안녕하세용",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "우리나라 자랑",
                style: TextStyle(
                  color: Color.fromARGB(255, 5, 8, 233), // Colors.grey[500]
                ),
              )
            ],
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.orange,
        ),
        const Text("999+"),
      ],
    ),
  );

  /// Widget 함수 선언하기 => () { return `~~~` } 형태
  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(20),
      child: const Text(
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고"
        "우리는 민족중흥의 역사적 사명을 띄고",
        softWrap: true,
      ),
    );
  }

  Widget colMethod() {
    return const Column(
      children: [
        Text(
          "우리나라",
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
          ),
        ),
        Text(
          "대한민국",
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
          ),
        ),
        Text(
          "하위^^",
          style: TextStyle(
            /// Size 는 단위가 없다.
            /// 이 크기는 Pixel Ratio 값을 곱하여 Pixel 로 표현한다
            fontSize: 30,

            /// 컬러를 지정하면 MaterialApp 에 Theme 를 설정했을 경우
            /// 실제 컬러와 다르게 보일 수 있다
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}
