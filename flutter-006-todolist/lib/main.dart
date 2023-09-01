import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  var todoList = [];

  // var todoList = [
  //   Todo(
  //     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //     content: "오늘은 금요일",
  //     complete: false,
  //   ),
  //   Todo(
  //     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //     content: "Flutter Project",
  //     complete: false,
  //   ),
  // ];

  Todo getTodo(String content) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:ss:mm").format(DateTime.now()),
        content: content,
        complete: false,
      );

  Widget alertDialog(BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        actions: [
          TextField(
            // keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar = SnackBar(content: Text("$value 가 추가되었음"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            decoration: const InputDecoration(
              hintText: "할일을 입력해 주세요",
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    /// State 클래스 내의 함수를 실행하여 결과를 가져온 후 todoList 를 만든다
    /// 이때 클래스 내의 함수를 호출하여 다른 변수를 만드는 경우
    /// 이 코드는 build 함수 내부에서 실행해야 한다
    // todoList.add = [
    //   getTodo("플러터 프로젝트"),
    //   getTodo("오늘은 금요일"),
    //   getTodo("내일은 토요일 무엇을 할까")
    // ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 240, 189),
        leading: Image.asset(
          "images/profile.jpg",
          fit: BoxFit.fill,
        ),
        title: const Text("나의 TodoList "),
        actions: [
          IconButton(
              onPressed: () {
                /// showDialog State 에서만 제공하는 함수
                showDialog(
                  context: context,
                  builder: (context) => alertDialog(context),
                );
              },
              icon: const Icon(
                Icons.add_alarm,
              ))
        ],
      ),
      body: ListView.builder(
        /// 리스트를 만들때 count 필수
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            splashColor:
                const Color.fromARGB(255, 254, 22, 38).withOpacity(0.5),
            title: Dismissible(
              key: Key(todoList[index].content),
              background: Container(
                color: Colors.green,
                child: const Text("삭제한다잉"),
              ),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todoList[index].sdate),
                        Text(todoList[index].stime),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        todoList[index].content,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.brown),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
