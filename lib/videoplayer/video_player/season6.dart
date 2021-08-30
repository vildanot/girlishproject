import 'package:flutter/material.dart';
import 'package:loginpage/videoplayer/video_player/model/video.model.dart';
import 'package:loginpage/videoplayer/video_player/util/theme.util.dart';
import 'package:loginpage/videoplayer/video_player/videos_player.dart';
import 'package:loginpage/videoplayer/video_player/model/control.model.dart';


class Videos6 extends StatefulWidget {
  Videos6({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season 6"),
        backgroundColor: Colors.purple[200] , 
      ),
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: " Meditation for Stress ",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/10-Minute%20Meditation%20For%20Stress_Trim.mp4?alt=media&token=ff18c0cf-8752-4062-a4a3-3af6d60c82bc",
              thumbnailUrl: 
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/stres.png?alt=media&token=b74c20f3-5a1d-4a65-b3a0-4279741f3168",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
           new NetworkVideo(
              id: "3",
              name: "Before Sleep",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/1%20Minute%20Relaxing%20Guided%20Meditation%20for%20Sleep%20_%20Get%20a%20Good%20Night%E2%80%99s%20Rest_Trim.mp4?alt=media&token=801e1531-5edd-4862-b788-ab7f56b22615",
              thumbnailUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/bedtime.png?alt=media&token=027f04ab-c345-4536-b2ff-0660ed1fd819",         
           ),
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
