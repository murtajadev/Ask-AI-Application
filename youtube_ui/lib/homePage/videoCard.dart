import 'package:flutter/material.dart';
import 'package:youtube_ui/showVideo/displayVideo.dart';

// ignore: must_be_immutable
class VideoCard extends StatefulWidget {
  VideoCard(
      {super.key,
      required this.name,
      required this.time,
      required this.url,
      required this.pictureName,
      required this.pictureChannle,
      required this.views,
      required this.nameChannle});
  String name;
  String time;
  String url;
  String pictureName;
  String pictureChannle;
  String nameChannle;
  // ignore: prefer_typing_uninitialized_variables
  final views;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double hightP = MediaQuery.of(context).size.height;
    double wigthP = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DisplayVideo(
            videoURL: widget.url,
            nameVideo: widget.name,
            nameChannle: widget.nameChannle,
            pictureChannle: widget.pictureChannle,
            views: widget.views,
          ),
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: hightP / 2.7,
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    height: hightP / 3.8,
                    //margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage(widget.pictureName),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    bottom: hightP / 100,
                    right: wigthP / 30,
                    child: Container(
                      height: hightP / 35,
                      width: wigthP / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Center(
                        child: Text(
                          widget.time,
                          style: TextStyle(
                              color: Colors.white, fontSize: wigthP / 28),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: hightP / 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: hightP / 16,
                    width: wigthP / 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.pictureChannle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: wigthP / 30,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: wigthP / 29,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: hightP * 0.0045,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.nameChannle,
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: wigthP / 30,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(
                              width: wigthP / 50,
                            ),
                            Text(
                              " •  ${widget.views.toString()}K Views",
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: wigthP / 33,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
