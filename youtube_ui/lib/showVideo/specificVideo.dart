// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecificsVideo extends StatefulWidget {
  const SpecificsVideo({super.key, this.Icon, this.name});
  final Icon;
  final name;

  @override
  State<SpecificsVideo> createState() => _SpecificsVideoState();
}

class _SpecificsVideoState extends State<SpecificsVideo> {
  @override
  bool do_click = false;
  Color? backgroundContaider;
  Color? colorText;
  Color? colorIcon;
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double hightP = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double wigthP = MediaQuery.of(context).size.width;
    backgroundContaider = do_click ? Colors.white : const Color(0xFF272727);
    colorIcon = do_click ? const Color(0xFF272727) : Colors.white;
    colorText = do_click ? Colors.black : Colors.white;
    return GestureDetector(
      onTap: () {
        setState(() {
          do_click = !do_click;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundContaider),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    do_click = !do_click;
                  });
                },
                iconSize: wigthP / 23,
                color: colorIcon,
                icon: Icon(widget.Icon)),
            Text(
              widget.name,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: wigthP / 28,
                    color: colorText,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              width: wigthP / 90,
            )
          ],
        ),
      ),
    );
  }
}

