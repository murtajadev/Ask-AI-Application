import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Catalog extends StatefulWidget {
  Catalog({super.key, required this.name, this.icon = false});
  // ignore: prefer_typing_uninitialized_variables
  final name;
  bool icon;

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  bool condColor = false;
  Color? backgroundContaider;
  Color? colorText;
  @override
  Widget build(BuildContext context) {
    backgroundContaider = condColor ? Colors.white : const Color(0xFF272727);
    colorText = condColor ? Colors.black : Colors.white;
    return GestureDetector(
      onTap: () {
        setState(() {
          condColor = !condColor;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundContaider),
        child: Center(
          child: Text(
            widget.name,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 15, color: colorText, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
