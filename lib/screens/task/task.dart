import 'package:flutter/material.dart';

import '../../color.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Tasks"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Column(
        children: [
          Container(
            height: size.height / 8,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color.fromARGB(205, 240, 7, 112),
                  Colors.red.withOpacity(0.2),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/coins3.png"))),
                      ),
                      SizedBox(
                        width: size.width / 20,
                      ),
                      const Text("My Balance")
                    ],
                  ),
                  Row(
                    children: [
                      const Text("20 coins"),
                      SizedBox(
                        width: size.width / 60,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/coins1.png"))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height/40,
          ),
          RewardTasks(size: size, coin: '3', task: 'Check In', work: 'Sign in',),
          SizedBox(
            height: size.height/40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(height: 0.5, thickness: 0.5, color: Colors.pink),
          ),
          SizedBox(
            height: size.height/40,
          ),
          RewardTasks(size: size, coin: '5', task: 'Quick Match', work: 'Go',),
          SizedBox(
            height: size.height/40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(height: 0.5, thickness: 0.5, color: Colors.pink),
          ),
          SizedBox(
            height: size.height/40,
          ),
          RewardTasks(size: size, coin: '5', task: 'Video chat', work: 'Go',),
          SizedBox(
            height: size.height/40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(height: 0.5, thickness: 0.5, color: Colors.pink),
          ),
          SizedBox(
            height: size.height/40,
          ),
          RewardTasks(size: size, coin: '10', task: 'Ist Purchase', work: 'Go',),
          SizedBox(
            height: size.height/40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(height: 0.5, thickness: 0.5, color: Colors.pink),
          )
        ],
      ),
    );
  }
}

class RewardTasks extends StatelessWidget {
  const RewardTasks({
    Key? key,
    required this.size, required this.task, required this.coin, required this.work,
  }) : super(key: key);

  final Size size;
  final String task;
  final String coin;
  final String work;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task),
          Row(
            children: [
              Text("+$coin coins"),
              SizedBox(
                width: size.width / 100,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/coins1.png"))),
              ),
              SizedBox(
                width: size.width / 50,
              ),
              Container(
                height: size.height / 40,
                width: size.width / 6,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      const Color.fromARGB(205, 240, 7, 112),
                      Colors.red.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Text(
                  work,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
