import 'package:flutter/material.dart';
import 'package:metachat/color.dart';
import 'package:video_player/video_player.dart';

class VideoController extends StatefulWidget {
  final String vid;
  const VideoController({Key? key, required this.vid,}) : super(key: key);

  @override
  State<VideoController> createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  late VideoPlayerController _controller;
  late Future _intilizevideoplayer;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.vid);
    _intilizevideoplayer = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(1);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: _intilizevideoplayer,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: languagetextcolor,
                ),
              );
            } else if (_controller.value.aspectRatio <= 9 / 16) {
              print(_controller.value.aspectRatio);
              return SizedBox(
                height: size.height,
                width: size.width,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              );
            } else {
              return Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              );
            }
          })),
    );
  }
}
