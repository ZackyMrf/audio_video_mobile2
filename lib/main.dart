import 'package:flutter/material.dart';
import 'musik.dart';
import 'offline_video.dart';
import 'youtube_video.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Multimedia",
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.queue_music),
                  text: "Music",
                ),
                Tab(
                  icon: Icon(Icons.video_library),
                  text: "Offline Video",
                ),
                Tab(
                  icon: Icon(Icons.video_call),
                  text: "Youtube Video",
                ),
              ],
              indicatorColor: Colors.amber,
            ),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: TabBarView(
              children: [
                Musik(),
                OfflineVideo(),
                YoutubeVideo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}