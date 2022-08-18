import 'package:flutter/material.dart';

import '../color.dart';

class ButtonWithIcon extends StatelessWidget {
  final String btnname;
  final VoidCallback ontap;
  final IconData icon;
  const ButtonWithIcon(
      {Key? key,
      required this.btnname,
      required this.ontap,
      required this.icon})
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white,),
              SizedBox(width: size.width/80,),
              Center(
                  child: Text(
                btnname,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )),
            ],
          )),
    );
  }
}
