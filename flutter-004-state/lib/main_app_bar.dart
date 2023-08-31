import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text(
        "안녕하세용",
      ),
      backgroundColor: const Color.fromARGB(255, 255, 102, 0),
      centerTitle: true,
      elevation: 15.0,
      actions: [
        IconButton(
          onPressed: () {
            const snackbar = SnackBar(content: Text("안녕하세욤"));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
