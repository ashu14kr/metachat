import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DailyRankingScreen extends StatelessWidget {
  const DailyRankingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height/50,),
            Text("Get Top ranks and earn Credits", style: TextStyle(color: Colors.pink),),
            SizedBox(height: size.height/30,),
            Top3(size: size, rank: '1',),
            SizedBox(height: size.height/30,),
            Top3(size: size, rank: '2',),
            SizedBox(height: size.height/30,),
            Top3(size: size, rank: '3',),
            SizedBox(height: size.height/30,),
            Divider(height: 1, thickness: 1, color: Colors.pink,),
            SizedBox(height: size.height/30,),
            AllRanks(size: size),
            SizedBox(height: size.height/30,),
            AllRanks(size: size),
            SizedBox(height: size.height/30,),
            AllRanks(size: size),
            SizedBox(height: size.height/30,),
            AllRanks(size: size),
          ],
        ),
      ),
    );
  }
}

class AllRanks extends StatelessWidget {
  const AllRanks({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
    Text("4", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),),
    SizedBox(width: size.width/20,),
    CircleAvatar(
          backgroundImage: NetworkImage("https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
          radius: 20,
        ),
        SizedBox(width: size.width/20,),
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rohini", style: TextStyle(color: Colors.pink),),
        SizedBox(height: size.height/120,),
        Row(
          children: [
            Text("12000", style: TextStyle(color: Colors.pink),),
            SizedBox(width: size.width/300,),
            Icon(FontAwesomeIcons.gift, color: Colors.pink, size: 12,)
          ],
        )
      ],
    ),
          ],
        ),
      ],
    );
  }
}

class Top3 extends StatelessWidget {
  const Top3({
    Key? key,
    required this.size, required this.rank,
  }) : super(key: key);

  final Size size;
  final String rank;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(rank, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),),
            SizedBox(width: size.width/20,),
            CircleAvatar(
          backgroundImage: NetworkImage("https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
          radius: 30,
        ),
        SizedBox(width: size.width/20,),
        Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rohini", style: TextStyle(color: Colors.pink, fontSize: 16),),
                SizedBox(height: size.height/120,),
                Row(
                  children: [
                    Text("12000", style: TextStyle(color: Colors.pink),),
                    SizedBox(width: size.width/300,),
                    Icon(FontAwesomeIcons.gift, color: Colors.pink, size: 12,)
                  ],
                )
              ],
            ),
          ],
        ),
        Icon(FontAwesomeIcons.medal, color: Color.fromARGB(255, 232, 209, 0), size: 50,)
      ],
    );
  }
}