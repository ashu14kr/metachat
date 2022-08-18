import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../color.dart';

class CustomerCare extends StatelessWidget {
  const CustomerCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: size.height/7.5,
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: size.height/15,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    SizedBox(
                      height: size.height/15,
                      width: size.width/1.3,
                      child: TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        hintText: "message...",
                        hintStyle: TextStyle(color: Colors.pink),
                        border: InputBorder.none,
                        counterText: "",
                      ),
                  ),
                    ),
                    const Icon(Icons.send, color: Colors.pink,)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.microphone, color: Colors.pink,)),
                  IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.image, color: Colors.pink,)),
                  IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.camera, color: Colors.pink,)),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Customer care"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
    );
  }
}