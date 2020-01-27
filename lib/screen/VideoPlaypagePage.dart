import 'package:flutter/material.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayPage extends StatelessWidget {
  Content content;

  VideoPlayPage(this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: SampleAppPage(content));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.content);

  Content content;

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  YoutubePlayerController _controller;
  bool play = false;

  @override
  void initState() {
    if (widget.content.video_url != null) {
      _controller = YoutubePlayerController(
        initialVideoId: '_4I7maBjaDk',
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          forceHideAnnotation: true,
        ),
      );
    }
    super.initState();
  }

  _SampleAppPageState();

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      progressColors: ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
      onReady: () {},
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
