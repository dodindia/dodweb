import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class titleHeadingtwoWidget extends StatelessWidget {
  titleHeadingtwoWidget({
    super.key,
    required this.leftHeading,
    required this.rightHeading,
    this.isTrue = false,
    this.fontSize = 80,
  });

  String leftHeading;
  String rightHeading;
  bool isTrue;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftHeading,
          style: GoogleFonts.dmSans(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            shadows: [
              Shadow(
                color: Colorconstants.white,
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
            foreground:
                Paint()
                  ..strokeWidth = 3
                  ..color = Colorconstants.mainBlue
                  ..style = PaintingStyle.stroke,
          ),
        ),
        isTrue
            ? TypeWriter.text(
              rightHeading,
              repeat: true,
              duration: Duration(seconds: 1),
              style: GoogleFonts.dmSans(
                color: Colorconstants.mainBlue,
                fontSize: fontSize - 10,
                fontWeight: FontWeight.w900,
              ),
            )
            : Text(
              rightHeading,
              style: GoogleFonts.dmSans(
                color: Colorconstants.mainBlue,
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
              ),
            ),
      ],
    );
  }
}
