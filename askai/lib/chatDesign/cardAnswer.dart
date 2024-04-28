import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class CardChat extends StatefulWidget {
  const CardChat({super.key, required this.ask, required this.answer});
  final String ask;
  final String answer;

  @override
  State<CardChat> createState() => _CardChatState();
}

class _CardChatState extends State<CardChat> {
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.answer));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double hightScreen = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double wigthScreen = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        width: wigthScreen / 0.5,
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // height: textAsk.length >20?? textAsk.length / 0.7:,
                  width: wigthScreen / 1.3,
                  padding: EdgeInsets.symmetric(
                      vertical: hightScreen / 80, horizontal: wigthScreen / 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("You ",
                              style: GoogleFonts.rubik(
                                  textStyle:
                                      TextStyle(fontSize: wigthScreen / 20))),
                          Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: hightScreen / 35,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: hightScreen / 100,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SelectableText(
                              widget.ask,
                              style: GoogleFonts.rubik(
                                textStyle:
                                    TextStyle(fontSize: wigthScreen / 28),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: hightScreen / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //height: textAnswer.length / 0.7,
                  width: wigthScreen / 1.3,

                  padding: EdgeInsets.only(
                      bottom: hightScreen / 30,
                      right: hightScreen / 100,
                      left: hightScreen / 80),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFffcf43)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            foregroundImage:
                                const AssetImage("asset/icons/robotAI.png"),
                            radius: wigthScreen / 30,
                          ),
                          Text(
                            " AI ",
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(fontSize: wigthScreen / 20),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: _copyToClipboard,
                            iconSize: wigthScreen / 20,
                            icon: const Icon(Icons.copy),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TypeWriterText(
                              text: Text(
                                widget.answer,
                                style: GoogleFonts.rubik(
                                    textStyle:
                                        TextStyle(fontSize: wigthScreen / 28)),
                              ),
                              duration: const Duration(milliseconds: 2),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
