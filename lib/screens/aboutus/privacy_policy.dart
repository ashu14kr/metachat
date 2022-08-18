import 'package:flutter/material.dart';

import '../../color.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Privacy Policy"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
    );
  }
}