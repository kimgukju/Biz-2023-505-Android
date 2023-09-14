import 'package:flutter/material.dart';

class MemoList extends StatefulWidget {
  const MemoList({super.key});

  @override
  State<MemoList> createState() => _MemoListState();
}

class _MemoListState extends State<MemoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("메모 리스트"),
      ),
      body: const Text("안뇽 나는 리스트"),
    );
  }
}
