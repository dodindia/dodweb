import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class servicesRectbox extends StatefulWidget {
  servicesRectbox({
    super.key,
    required this.heading,
    required this.content,
    required this.serviceNum,
    this.con_height = 244,
    this.con_width = 615,
  });

  double? con_height;
  double? con_width;
  String heading;
  String content;
  String serviceNum;

  @override
  State<servicesRectbox> createState() => _servicesRectboxState();
}

class _servicesRectboxState extends State<servicesRectbox> {
  bool shouldShowText = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmall = screenWidth < 860;

    // Responsive adjustments
    final double boxHeight =
        isSmall ? widget.con_height! + 80 : widget.con_height!;
    final double boxWidth = isSmall ? double.infinity : widget.con_width!;
    final double headingFontSize = isSmall ? 24 : 28;
    final double contentFontSize = isSmall ? 18 : 22;
    final double horizontalPadding = isSmall ? 20 : 40;

    return Stack(
      children: [
        Container(
          height: boxHeight,
          width: boxWidth,
          decoration: BoxDecoration(
            gradient: Colorconstants.bluegrad,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colorconstants.lightBlue,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.heading,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: headingFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colorconstants.black,
                    ),
                  ),
                  SizedBox(height: isSmall ? 20 : 30),
                  TypeWriter.text(
                    repeat: false,
                    duration: Duration(milliseconds: 60),
                    widget.content,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontSize: contentFontSize,
                      fontWeight: FontWeight.w400,
                      color: Colorconstants.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          child: Container(
            height: isSmall ? 56 : 90,
            width: isSmall ? 54 : 88,
            decoration: BoxDecoration(
              color: Colorconstants.mainBlue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(isSmall ? 30 : 50),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.serviceNum,
                style: GoogleFonts.dmSans(
                  color: Colorconstants.softOrange,
                  fontSize: isSmall ? 18 : 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
