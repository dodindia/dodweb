import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    this.buttonborderColor = Colorconstants.transparent,
    this.onPressed,
    this.fontsize = 18,
  });
  String buttonText;
  Color textColor;
  Color buttonColor;
  Color buttonborderColor;
  double fontsize;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: buttonborderColor),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(buttonColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: GoogleFonts.ibmPlexMono(color: textColor, fontSize: fontsize),
        ),
      ),
    );
  }
}
