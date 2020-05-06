import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hajjapp/model/Content.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/screen/VideoPlaypagePage.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 1.5,
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
                      width: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.content.content_id.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        widget.content.title ?? "",
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
              widget.content.image?.isNotEmpty == true
                  ? Image.asset(
                      widget.content.image,
                      width: MediaQuery.of(context).size.width,
                    )
                  : SizedBox(),
              widget.content.video_url?.isNotEmpty == true
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayPage(widget.content),
                            ));
                      },
                      child: Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                              imageUrl: YoutubePlayer.getThumbnail(videoId: "_4I7maBjaDk"),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => CircularProgressIndicator()),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.play_arrow,
                                size: 64.0,
                                color: Colors.white,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
