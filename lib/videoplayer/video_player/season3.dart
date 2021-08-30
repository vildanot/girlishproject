import 'package:flutter/material.dart';
import 'package:loginpage/videoplayer/video_player/model/video.model.dart';
import 'package:loginpage/videoplayer/video_player/util/theme.util.dart';
import 'package:loginpage/videoplayer/video_player/videos_player.dart';
import 'package:loginpage/videoplayer/video_player/model/control.model.dart';


class Videos3 extends StatefulWidget {
  Videos3({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season 3"),
        backgroundColor: Colors.purple[200] , 
      ),
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: " Start Your Day ",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/10-Minute%20Meditation%20To%20Start%20Your%20Day_Trim.mp4?alt=media&token=9da708c5-a855-4028-ab44-dae624dd8f31",
              thumbnailUrl: 
              "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/start.png?alt=media&token=98454a52-b945-488c-8ff0-18f2ceb5685b",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
           new NetworkVideo(
              id: "3",
              name: "Find Your Focus",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/10-Minute%20Meditation%20To%20Start%20Your%20Day_Trim.mp4?alt=media&token=9da708c5-a855-4028-ab44-dae624dd8f31",
              thumbnailUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/focus.png?alt=media&token=f9243b59-7666-4f51-beca-363f94e7cd66",         
           ),
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
