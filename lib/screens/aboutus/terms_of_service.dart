import 'package:flutter/material.dart';

import '../../color.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Terms of service"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
    );
  }
}