import 'package:flutter/material.dart';
import 'package:youtube_ui/homePage/appBar.dart';
import 'package:youtube_ui/homePage/catalogWidget.dart';
import 'package:youtube_ui/homePage/videoCard.dart';
import 'package:youtube_ui/modul/videoInformation.dart';

List<String> catalogs = [
  "All",
  "New to you",
  "Music",
  "Maxis",
  "Gaming",
  "Live",
  "History"
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final hightM = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final wigthM = MediaQuery.of(context).size.width;
    videoInfo.shuffle();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: hightM / 40,
              bottom: hightM / 80,
              left: wigthM / 100,
              right: wigthM / 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarDesign(),
              SizedBox(
                height: hightM / 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catalogs.length,
                  itemBuilder: (context, index) => Catalog(
                    name: catalogs[index],
                  ),
                ),
              ),
              SizedBox(
                height: hightM / 70,
              ),
              SizedBox(
                height: hightM / 1.2,
                child: ListView.builder(
                  itemCount: videoInfo.length,
                  itemBuilder: (context, index) => VideoCard(
                    name: videoInfo[index]["name"],
                    time: videoInfo[index]["time"],
                    url: videoInfo[index]["URL"],
                    pictureName: videoInfo[index]["picture"],
                    pictureChannle: videoInfo[index]["channel"],
                    nameChannle: videoInfo[index]["nameChannle"],
                    views: videoInfo[index]["View"],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
