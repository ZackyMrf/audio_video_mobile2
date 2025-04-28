import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Musik extends StatefulWidget {
  @override
  _MusikState createState() => _MusikState();
}

class _MusikState extends State<Musik> {
  AudioPlayer player = AudioPlayer();
  double volume = 0.5;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Play Musik",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: Image(
                  image: AssetImage("assets/musik.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              
              // Volume control
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.volume_down),
                    Expanded(
                      child: Slider(
                        value: volume,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          setState(() {
                            volume = value;
                            player.setVolume(volume);
                          });
                        },
                      ),
                    ),
                    Icon(Icons.volume_up),
                  ],
                ),
              ),
              
              // Volume buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Icon(Icons.volume_down),
                    onPressed: () {
                      setState(() {
                        volume = (volume - 0.1).clamp(0.0, 1.0);
                        player.setVolume(volume);
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  Text('${(volume * 100).toInt()}%'),
                  SizedBox(width: 20),
                  ElevatedButton(
                    child: Icon(Icons.volume_up),
                    onPressed: () {
                      setState(() {
                        volume = (volume + 0.1).clamp(0.0, 1.0);
                        player.setVolume(volume);
                      });
                    },
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              
              // Playback controls
              ElevatedButton(
                child: Text('Play'),
                onPressed: () async {
                  await player.setVolume(volume);
                  await player.play(AssetSource('Iphone.mp3'));
                },
              ),
              ElevatedButton(
                child: Text('Pause'),
                onPressed: () async {
                  await player.pause();
                },
              ),
              ElevatedButton(
                child: Text('Resume'),
                onPressed: () async {
                  await player.resume();
                },
              ),
              ElevatedButton(
                child: Text('Stop'),
                onPressed: () async {
                  await player.stop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}