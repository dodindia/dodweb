import 'package:dod_web/utils/Animation_constants/animationconstants.dart';
import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:dod_web/utils/Image_constants/imageconstants.dart';
import 'package:dod_web/view/home_Screen/widgets/ButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Mobilehomescreen extends StatelessWidget {
  Mobilehomescreen({
    super.key,
    required this.context,
    required this.homesession,
  });
  BuildContext context;
  GlobalKey homesession;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isTab = screenWidth > 860 && screenWidth < 1100;
    bool isMobile = screenWidth <= 860;
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Column(
        children: [
          SizedBox(height: 30),
          Align(
            alignment: AlignmentDirectional.center,
            child: RichText(
              text: TextSpan(
                text: "Your Ride, Your Way\n",
                style: GoogleFonts.dmSans(
                  fontSize: isMobile ? 32 : 80,

                  color: Colorconstants.mainBlue,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                    text: " Anytime, Anywhere!",
                    style: GoogleFonts.dmSans(
                      fontSize: isMobile ? 32 : 80,
                      color: Colorconstants.pineBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: isMobile ? 35 : 30),

          // Description
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              "From boardrooms to backroads, DOD\n  delivers seamless rides for leisure,\n business, and beyond.",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                color: Colorconstants.pineBlack,
                fontSize: isMobile ? 18 : 26,
              ),
            ),
          ),

          SizedBox(height: isMobile ? 28 : 30),
          Row(
            children: [
              ButtonWidget(
                onPressed: () {
                  launchWhatsApp(
                    phone: "919731907858",
                    message:
                        "*Hi, I would like to hire a driver. Please assist me with the process.*",
                  );
                },
                buttonText: "Book Driver",
                buttonColor: Colorconstants.mainBlue,
                textColor: Colorconstants.white,
              ),
              SizedBox(width: 10),
              ButtonWidget(
                onPressed: () async {
                  final String phoneNumber = "+917907538061";
                  final Uri url = Uri(scheme: 'tel', path: phoneNumber);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                buttonText: "Call Now",
                buttonColor: Colorconstants.white,
                textColor: Colorconstants.mainBlue,
                buttonborderColor: Colorconstants.mainBlue,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 0 : 26),
          Container(
            width: screenWidth - 20,
            child: Lottie.asset(Animationconstants.dod_heroanijs),
          ),
        ],
      ),
    );
  }

  void launchWhatsApp({required String phone, required String message}) async {
    final Uri whatsappUrl = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrlString(whatsappUrl.toString())) {
      await launchUrlString(whatsappUrl.toString());
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
