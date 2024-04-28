import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  TextEditingController comment = TextEditingController();

  Widget build(BuildContext context) {
    double hightP = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double wigthP = MediaQuery.of(context).size.width;
    return Container(
      height: hightP / 10,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(
          0xFF272727,
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Comments",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: wigthP / 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: hightP / 70,
            ),
            TextFormField(
              controller: comment,
              style: TextStyle(color: Colors.white, fontSize: wigthP / 30),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 3),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 108, 107, 107)),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 108, 107, 107)),
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 108, 107, 107),
                hintText: "  Add Comment",
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: wigthP / 40),
              ),
              keyboardType: TextInputType.name,
            )
          ],
        ),
      ),
    );
  }
}
