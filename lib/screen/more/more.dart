import 'package:flutter/material.dart';
import 'package:job_task/contant/color.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          'More',
          style: TextStyle(color: black),
        ),
      ),
    );
  }
}
