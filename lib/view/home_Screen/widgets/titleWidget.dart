import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class titleWidget extends StatelessWidget {
  titleWidget({
    super.key,
    this.toptitle = "Our",
    this.topshadowcolor = Colorconstants.white,
    this.topbordercolor = Colorconstants.mainBlue,
    this.bottomTitle = "Services",
    this.bottomColor = Colorconstants.mainBlue,
    this.bordercolor = Colorconstants.mainBlue,
    this.height = 180,
    this.btposition = 22,
    this.width = 380,
    this.fontsize = 80,
  });
  double height;
  double width;
  double fontsize;
  double btposition;

  String toptitle;

  Color topshadowcolor;
  Color topbordercolor;
  String bottomTitle;
  Color bottomColor;
  Color bordercolor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Text(
                toptitle,
                style: GoogleFonts.dmSans(
                  fontSize: fontsize,

                  fontWeight: FontWeight.w900,
                  shadows: [
                    Shadow(
                      color: topshadowcolor,
                      offset: Offset(2, 2),
                      blurRadius: 3,
                    ),
                  ],
                  foreground:
                      Paint()
                        ..strokeWidth = 3
                        ..color = topbordercolor
                        ..style = PaintingStyle.stroke,
                ),
              ),

              Positioned(
                bottom: btposition,
                child: Text(
                  bottomTitle,
                  style: GoogleFonts.dmSans(
                    fontSize: fontsize,
                    fontWeight: FontWeight.w900,
                    color: bottomColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(),
        Expanded(
          child: Container(
            height: 13,
            decoration: BoxDecoration(
              color: bordercolor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
            ),
          ),
        ),
      ],
    );
  }
}
