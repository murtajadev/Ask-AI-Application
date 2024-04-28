import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

bool visible1 = false;
//this Variable create as global in class that contain List View
final ScrollController scrollController = ScrollController();

class AnswerBox extends StatefulWidget {
  const AnswerBox({super.key, required this.chatsMessages});
  final List chatsMessages;

  @override
  State<AnswerBox> createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  @override
  Widget build(BuildContext context) {
    double hightScreen = MediaQuery.of(context).size.height;
    double wigthScreen = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: hightScreen / 100),
      padding: EdgeInsets.symmetric(horizontal: wigthScreen / 100),
      height: hightScreen / 1.35,
      width: wigthScreen / 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        //this controller for ListView
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        children: [
          for (int i = 0; i < widget.chatsMessages.length; i++)
            widget.chatsMessages[i],
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: visible1,
                child: LoadingAnimationWidget.threeRotatingDots(
                    color: const Color(0xFFffcf43), size: wigthScreen / 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
