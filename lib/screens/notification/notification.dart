import 'package:flutter/material.dart';

import '../../color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Notification"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
    );
  }
}