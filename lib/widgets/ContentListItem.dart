import 'package:flutter/material.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/widgets/ColorChangeWidget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentListItem extends StatefulWidget {
  Content content;
  Subtopic subtopic;

  ContentListItem({
    this.content,
    this.subtopic,
  });

  @override
  _ContentListItemState createState() => _ContentListItemState();
}

class _ContentListItemState extends State<ContentListItem> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    if(widget.content.video_url != null) {
      _controller = YoutubePlayerController(
        initialVideoId: '_4I7maBjaDk',
//      initialVideoId: YoutubePlayer.convertUrlToId(widget.content.video_url),
        flags: YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          forceHideAnnotation: true,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Theme.of(context).accentColor),
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.content.content_id.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        widget.subtopic.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
//                  IconButton(
//                    icon: Icon(
//                      Icons.more_vert,
//                      size: 24.0,
//                    ),
//                    onPressed: () {
//                    },
//                  ),
                    Container(
                      decoration: BoxDecoration(color: Theme.of(context).accentColor),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Text(
                        "",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              SizedBox(height: 6),
              widget.content.image != null
                  ? Image.asset(
                      widget.content.image,
                      width: MediaQuery.of(context).size.width,
                    )
                  : SizedBox(),
              widget.content.video_url.isNotEmpty
                  ? YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.amber,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                      onReady: () {
//                    _controller.addListener(listener);
                      },
                    )
                  : SizedBox(),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.content.text,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              SizedBox(height: 6),

//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  content.referenceEn,
//                  style: TextStyle(fontSize: 12),
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
