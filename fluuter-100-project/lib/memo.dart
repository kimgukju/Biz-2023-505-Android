import 'package:flutter/material.dart';

class Memo extends StatefulWidget {
  const Memo({super.key});

  @override
  State<Memo> createState() => _MemoState();
}

class _MemoState extends State<Memo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("메모")),
      body: const Text("나는 메모장"),
    );
  }
}
