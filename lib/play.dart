

import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {
  double value = 0.5;
  double end = 0.0; // 追加
  bool isPlaying = false; // 追加

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            child: Image.network(
              'https://i.kfs.io/album/global/156376942,1v1/fit/500x500.jpg',
              width: 400,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          const Center(
            child: Text(
              'Happy Face',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 5),
          const Center(
            child: Text(
              'Jagwar Twin',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          Column( // 追加
            children: [
              Slider(
                value: value,
                onChanged: (double newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
                min: 0.0,
                max: 1.0,
                activeColor: Colors.white,
                onChangeEnd: (double endValue) {
                  setState(() {
                    end = endValue;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("0:00"), // 開始時間を表示
                  Expanded(
                    child: Container(),
                  ),
                  Text(formatDuration(end)), // 終了時間を表示
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {},
                iconSize: 50,
              ),
              IconButton(
                icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                iconSize: 90,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {},
                iconSize: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 再生時間の表示形式を変更するための関数
  String formatDuration(double duration) {
    int seconds = (duration * 60).round();
    String minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    seconds = (seconds % 60);
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutes:$secondsStr';
  }
}

