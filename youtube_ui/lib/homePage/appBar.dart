import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarDesign extends StatelessWidget {
  const AppBarDesign({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final hightM = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final wigthM = MediaQuery.of(context).size.width;

    return SizedBox(
      height: hightM / 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/icons/youtubeLogo.jpg",
            height: hightM / 18,
          ),
          SizedBox(
            width: wigthM / 100,
          ),
          Text(
            "YouTube",
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                  fontSize: wigthM / 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cast_rounded,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined,
                  color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white)),
        ],
      ),
    );
  }
}
