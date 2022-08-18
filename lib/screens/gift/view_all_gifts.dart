import 'package:flutter/material.dart';
import 'package:metachat/color.dart';

class ViewAllGifts extends StatelessWidget {
  const ViewAllGifts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("All Gifts"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1608755727748-dfa2e44f255b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGdpZnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover)),
              ),
            );
          }),
    );
  }
}
