import 'package:flutter/material.dart';
import 'package:loginpage/videoplayer/video_player/model/video.model.dart';
import 'package:loginpage/videoplayer/video_player/util/theme.util.dart';
import 'package:loginpage/videoplayer/video_player/videos_player.dart';
import 'package:loginpage/videoplayer/video_player/model/control.model.dart';


class Videos extends StatefulWidget {
  Videos({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season 1"),
        backgroundColor: Colors.purple[200] , 
      ),
      body: VideosPlayer(
        networkVideos: [
         
              new NetworkVideo(
              id: "2",
              name: "Meditation for Beginners ",
              videoUrl:
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/10-Minute%20Meditation%20For%20Beginners_Trim.mp4?alt=media&token=952dbcab-9cce-48e4-b90f-19fe98b6c1ed",
              thumbnailUrl:
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/meditation%20for%20beginners.png?alt=media&token=17c92a11-eac5-4077-8651-b93b9a1ee199",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
              new NetworkVideo(
              id: "3",
              name: "Unwind meditation ",
              videoUrl:
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/Headspace%20_%20Mini%20meditation%20_%20Unwindd.mp4?alt=media&token=a5626462-bdfe-4002-806a-feab3cfde2fa",
              thumbnailUrl:
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/breathe.png?alt=media&token=f774da71-47bb-4a34-aad4-6bd3234c3758",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
           
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
