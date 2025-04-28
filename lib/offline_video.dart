import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OfflineVideo extends StatefulWidget {
  OfflineVideo({Key? key}) : super(key: key);

  @override
  _OfflineVideoState createState() => _OfflineVideoState();
}

class _OfflineVideoState extends State<OfflineVideo> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/Butterfly.mp4');
    _initializeVideoPlayerFuture = _controller!.initialize();
    _controller!.setLooping(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text("Play Video"),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                } else {
                  _controller!.play();
                }
              });
            },
            child: Icon(_controller!.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow),
          ),
        ],
      ),
    );
  }
}