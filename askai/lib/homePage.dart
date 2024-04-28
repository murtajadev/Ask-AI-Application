import 'dart:async';

import 'package:askai/chatDesign/answerAi.dart';
import 'package:askai/chatDesign/cardAnswer.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:motion_toast/motion_toast.dart';

final ScrollController _scrollController = ScrollController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> stateKey = GlobalKey();
  TextEditingController askText = TextEditingController();

  List chatsMessage = [];
  String result = "";
  // ignore: non_constant_identifier_names
  Future<void> CommenunicationWithAi(String ask) async {
    final model = GenerativeModel(
        model: "gemini-pro", apiKey: "AIzaSyALzmctIFlCq4-c439couWzYxYa6SxbDD4");
    final content = [Content.text(ask)];
    result = "Please wait ...";
    final response = await model.generateContent(content);
    setState(() {
      result = response.text.toString();
      //this Lines write in function turn when press on button to turn on
      scrollController.animateTo(scrollController.offset + 300,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
      visible1 = false;
      chatsMessage.add(CardChat(ask: ask, answer: result));
    });
  }

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 500),
      () => MotionToast.info(
        borderRadius: 15,
        title: const Text("هذا التطبيق من تطوير \n Murtaja_Dev"),
        animationCurve: Curves.elasticOut,
        dismissable: false,
        position: MotionToastPosition.top,
        description: const Text("اصدار التطبيق 0.2.0"),
      ).show(context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hightScreen = MediaQuery.of(context).size.height;
    double wigthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFffcf43),
        title: Center(
          child: Text(
            "Ask Ai",
            style: GoogleFonts.rubik(
              textStyle: TextStyle(fontSize: wigthScreen / 20),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: hightScreen / 90, horizontal: wigthScreen / 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnswerBox(
                chatsMessages: chatsMessage,
              ),
              Form(
                key: stateKey,
                child: TextFormField(
                  controller: askText,
                  maxLines: 4,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please write your message !!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        right: wigthScreen / 20,
                        left: wigthScreen / 40,
                        top: 10),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (stateKey.currentState!.validate()) {
                          CommenunicationWithAi(askText.text);
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            visible1 = true;
                            askText.text = "";
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: hightScreen / 25,
                        width: wigthScreen / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFffcf43),
                        ),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    hintTextDirection: TextDirection.ltr,
                    hintText: "Write your Ask......",
                    hintStyle: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: wigthScreen / 25),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
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
