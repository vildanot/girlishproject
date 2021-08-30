import 'package:flutter/material.dart';
import 'package:loginpage/videoplayer/video_player/model/video.model.dart';
import 'package:loginpage/videoplayer/video_player/util/theme.util.dart';
import 'package:loginpage/videoplayer/video_player/videos_player.dart';
import 'package:loginpage/videoplayer/video_player/model/control.model.dart';


class Videos2 extends StatefulWidget {
  Videos2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season 2"),
        backgroundColor: Colors.purple[200] , 
      ),
      body: VideosPlayer(
        networkVideos: [
          new NetworkVideo(
              id: "2",
              name: " Daily Meditation ",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/10-Minute%20Daily%20Meditation_Trim.mp4?alt=media&token=f8086c7a-76cd-48ad-a231-20817c2335da",
              thumbnailUrl: "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/blue%20daily%20trim.png?alt=media&token=8ec5d820-2bf6-4b1e-9b82-b49c7de89206",
              videoControl: new NetworkVideoControl(
                fullScreenByDefault: false,
              )),
           new NetworkVideo(
              id: "3",
              name: "Take a Breathe",
              videoUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/Headspace%20_%20Mini%20meditation%20_%20Breathe_Trim.mp4?alt=media&token=b6c7bb49-b7f5-49bc-b6fc-cc007f656444",
              thumbnailUrl:
                  "https://firebasestorage.googleapis.com/v0/b/girlishdemo.appspot.com/o/breathe.png?alt=media&token=f774da71-47bb-4a34-aad4-6bd3234c3758"),
         
          
        ],
        playlistStyle: Style.Style2,
      ),
    );
  }
}
