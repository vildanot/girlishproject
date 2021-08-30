import 'package:flutter/material.dart';
import 'package:loginpage/videoplayer/video_player/model/video.model.dart';
import 'package:loginpage/videoplayer/video_player/util/theme.util.dart';
import 'package:loginpage/videoplayer/video_player/videos_player.dart';
import 'package:loginpage/videoplayer/video_player/model/control.model.dart';


class Videos5 extends StatefulWidget {
  Videos5({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season 5"),
        backgroundColor: Colors.purple[200] , 
      ),
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: " Meditation for Anxiety ",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/10-Minute%20Meditation%20For%20Anxiety_Trim.mp4?alt=media&token=c00055d7-a3eb-4f83-aa6f-cd24faf6fa7b",
              thumbnailUrl: 
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/anxiety.png?alt=media&token=166ac922-9bb2-4125-9a26-e4c7c55a2a3d",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
           new NetworkVideo(
              id: "3",
              name: "Appreciate Nature",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/Mini%20meditation%20_%20Appreciate%20nature_Trim.mp4?alt=media&token=77ea1fcf-0527-4496-8f63-90fdab395c47",
              thumbnailUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/stres.png?alt=media&token=b74c20f3-5a1d-4a65-b3a0-4279741f3168",         
           ),
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
