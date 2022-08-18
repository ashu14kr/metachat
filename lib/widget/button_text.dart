import 'package:flutter/material.dart';

import '../color.dart';

class ButtonText extends StatelessWidget {
  final String btnname;
  final VoidCallback ontap;
  const ButtonText({Key? key, required this.btnname, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: size.height / 16,
        width: size.width / 1.3,
        decoration: BoxDecoration(
          color: languagetextcolor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
            child: Text(
          btnname,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
