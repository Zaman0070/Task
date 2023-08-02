import 'package:flutter/material.dart';

import '../../contant/color.dart';

class MediaLibrary extends StatelessWidget {
  const MediaLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          'Media Library',
          style: TextStyle(color: black),
        ),
      ),
    );
  }
}
