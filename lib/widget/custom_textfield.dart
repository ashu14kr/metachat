import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  const CustomTextField({Key? key, required this.hint, required this.controller, required this.keyboardtype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(hint, style: const TextStyle(color: Colors.black, fontSize: 18),),
          ),
          SizedBox(height: size.height/100,),
          Container(
            height: size.height / 13,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardtype,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    counterText: "",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
