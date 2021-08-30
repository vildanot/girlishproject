import 'package:flutter/material.dart';
import 'package:loginpage/videoplayer/video_player/model/video.model.dart';
import 'package:loginpage/videoplayer/video_player/util/theme.util.dart';
import 'package:loginpage/videoplayer/video_player/videos_player.dart';
import 'package:loginpage/videoplayer/video_player/model/control.model.dart';


class Videos4 extends StatefulWidget {
  Videos4({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season 4"),
        backgroundColor: Colors.purple[200] , 
      ),
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: " Meditation for Healing ",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/10-Minute%20Meditation%20For%20Healing_Trim.mp4?alt=media&token=520c59fc-66af-4ab3-a84f-bf8e3b09db26",
              thumbnailUrl: 
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/healing.png?alt=media&token=1bac7cd2-4a81-403d-92af-523b01590c69",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
           new NetworkVideo(
              id: "3",
              name: "Let Go Off Stress",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/Headspace%20_%20Mini%20Meditation%20_%20Let%20Go%20of%20Stress_Trim.mp4?alt=media&token=52b5b710-99ae-4119-9644-2dded1e6a5bf",
              thumbnailUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/stres.png?alt=media&token=b74c20f3-5a1d-4a65-b3a0-4279741f3168",         
           ),
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
