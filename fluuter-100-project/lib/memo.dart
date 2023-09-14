import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Memo extends StatefulWidget {
  const Memo({super.key});

  @override
  State<Memo> createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  String selectedDay = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("메모")),
      body: ListView(
        children: [
          Column(
            children: [
              const Text(
                "내용",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // 패딩을 줘서 넓이 조절
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "내용을 입력하세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(width: 3), // ????? 왜 안먹음?
                    ),
                    // 포커싱 됬을때 효과 주기
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.orange, width: 3),
                    ),
                  ),
                  maxLines: 10,
                ),
              )
            ],
          ),
          Column(
            children: [
              const Text(
                "달력",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                onPressed: () => selectDay(context),
                iconSize: 150,
                color: Colors.amber,
              ),
              Text(
                "선택한날짜 : $selectedDay",
                style: const TextStyle(fontSize: 15),
              )
            ],
          ),
          // IconButton(
          //   onPressed: () => false,
          //   icon: const Icon(Icons.add_circle_outline_outlined),
          //   iconSize: 70,
          // )
        ],
      ),
    );
  }

  Future<DateTime?> selectDay(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2000, 1, 1),
      lastDate: DateTime.utc(2100, 12, 31),
    );
    if (selected != null) {
      setState(() {
        selectedDay = (DateFormat.yMMMd()).format(selected);
      });
    }
    return null;
  }
}
