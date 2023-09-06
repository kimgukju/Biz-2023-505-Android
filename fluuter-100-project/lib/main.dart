import 'package:flutter/material.dart';
import 'package:project/calendar.dart';
import 'package:project/memo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("My Notepad"),
        ),
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Calendar()));
                },
                icon: const Icon(
                  Icons.calendar_month_outlined,
                ),
                iconSize: 150,
              ),
              const Text("     "),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Memo()));
                },
                icon: const Icon(
                  Icons.note_add,
                ),
                iconSize: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
