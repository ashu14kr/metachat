import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:metachat/color.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final File vid;
  const CustomVideoPlayer({Key? key, required this.vid}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  late Future _intilizevideoplayer;

  @override
  void initState() {
    _controller = VideoPlayerController.file(widget.vid);
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
            }
            else if (_controller.value.duration.inSeconds > 60) {
              EasyLoading.showToast(
                  "we only allow videos that are shorter than 1 minute!",
                  duration: Duration(seconds: 5)
              );
              Navigator.pop(context);
              _controller.dispose();
              return Container();
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
