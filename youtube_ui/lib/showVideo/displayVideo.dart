// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_ui/homePage/videoCard.dart';
import 'package:youtube_ui/modul/videoInformation.dart';
import 'package:youtube_ui/showVideo/addComment.dart';
import 'package:youtube_ui/showVideo/specificVideo.dart';

class DisplayVideo extends StatefulWidget {
  const DisplayVideo(
      {super.key,
      this.videoURL,
      this.views,
      this.pictureChannle,
      this.nameChannle,
      this.nameVideo});
  final videoURL;
  final pictureChannle;
  final nameChannle;
  final nameVideo;
  final views;

  @override
  State<DisplayVideo> createState() => _DisplayVideoState();
}

class _DisplayVideoState extends State<DisplayVideo> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    super.initState();
  }

  TextEditingController comment = TextEditingController();

  bool dosubscrib = false;
  bool turnNotifications = false;
  List specificVideo = [
    {"icon": Icons.thumb_up_alt_outlined, "name": "Like"},
    {"icon": Icons.thumb_down_alt_outlined, "name": "disLike"},
    {"icon": Icons.share_outlined, "name": "Share"},
    {"icon": Icons.block, "name": "Stop Ads"},
    {"icon": Icons.file_download, "name": "Download"},
    {"icon": Icons.bookmark_outline, "name": "Save"},
    {"icon": Icons.flag, "name": "report"},
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double hightP = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double wigthP = MediaQuery.of(context).size.width;
    suggest_video.shuffle();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: hightP / 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: hightP / 70,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () => debugPrint("Ready"),
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(
                      isExpanded: true,
                      colors: const ProgressBarColors(
                          playedColor: Colors.red,
                          handleColor: Colors.redAccent),
                    ),
                    const PlaybackSpeedButton(),
                    FullScreenButton(),
                  ],
                ),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.nameVideo,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: wigthP / 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: wigthP / 20,
                  ),
                  Text(
                    "${widget.views}k views",
                    style:
                        TextStyle(fontSize: wigthP / 30, color: Colors.white60),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: hightP / 25,
                    width: wigthP / 12,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.pictureChannle),
                      ),
                    ),
                  ),
                  Text(
                    widget.nameChannle,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: wigthP / 30,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dosubscrib = !dosubscrib;
                      });
                    },
                    child: AnimatedContainer(
                      height: hightP / 28,
                      width: dosubscrib ? wigthP / 3 : wigthP / 4.7,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      curve: Easing.legacy,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // ignore: dead_code
                          color: dosubscrib ? Colors.white : Colors.grey),
                      child: dosubscrib
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Text(
                                    "You Subscrib",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      turnNotifications = !turnNotifications;
                                    });
                                  },
                                  icon: turnNotifications
                                      ? const Icon(Icons.notifications_active)
                                      : const Icon(Icons.notifications),
                                )
                              ],
                            )
                          : const Center(
                              child: Text(
                                "Subscribe",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: hightP / 60,
              ),
              SizedBox(
                height: hightP / 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specificVideo.length,
                  itemBuilder: (context, index) => SpecificsVideo(
                    name: specificVideo[index]["name"],
                    Icon: specificVideo[index]["icon"],
                  ),
                ),
              ),
              SizedBox(
                height: hightP / 40,
              ),
              // Add Comment
              const AddComment(),
              SizedBox(
                height: hightP / 2,
                child: ListView.builder(
                  itemCount: suggest_video.length,
                  itemBuilder: (context, index) => VideoCard(
                    name: suggest_video[index]["name"],
                    time: suggest_video[index]["time"],
                    url: suggest_video[index]["URL"],
                    pictureName: suggest_video[index]["picture"],
                    pictureChannle: suggest_video[index]["channel"],
                    nameChannle: suggest_video[index]["nameChannle"],
                    views: suggest_video[index]["View"],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
