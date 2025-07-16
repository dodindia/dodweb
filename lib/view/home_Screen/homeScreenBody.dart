import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dod_web/utils/Animation_constants/animationconstants.dart';
import 'package:dod_web/view/home_Screen/widgets/InstagramStyleReviewCard%20.dart';
import 'package:dod_web/view/home_Screen/widgets/titleMobile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:dod_web/utils/Image_constants/imageconstants.dart';
import 'package:dod_web/view/home_Screen/widgets/ButtonWidget.dart';
import 'package:dod_web/view/home_Screen/widgets/FAQSection.dart';
import 'package:dod_web/view/home_Screen/widgets/mobilehomescreen.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:web/web.dart' as web;
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dod_web/view/home_Screen/widgets/clientsLogoWidget.dart';
import 'package:dod_web/view/home_Screen/widgets/servicesRectbox.dart';
import 'package:dod_web/view/home_Screen/widgets/titleHeadingtwoWidget.dart';
import 'package:dod_web/view/home_Screen/widgets/titleWidget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class homeScreenBody extends StatefulWidget {
  final GlobalKey homeKey;
  final GlobalKey serviceKey;
  final GlobalKey businessKey;
  final GlobalKey aboutKey;
  final ScrollController scrollController;
  final VoidCallback scrolltoTop;
  final bool showScrollToTop;

  const homeScreenBody({
    super.key,
    required this.homeKey,
    required this.serviceKey,
    required this.businessKey,
    required this.aboutKey,
    required this.scrollController,
    required this.scrolltoTop,
    required this.showScrollToTop,
  });

  @override
  State<homeScreenBody> createState() => _homeScreenBodyState();
}

class _homeScreenBodyState extends State<homeScreenBody> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < 1100;

    return Container(
      color: Colorconstants.white,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          backgroundLinesWidget(),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                controller: widget.scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //Main Column
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: isMobile ? 0 : 111,
                        top: 0,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            isMobile
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isMobile
                              ? Mobilehomescreen(
                                context: context,
                                homesession: widget.homeKey,
                              )
                              : _titleSection_leftSide(
                                context,
                                isMobile,
                                widget.homeKey,
                              ),

                          if (!isMobile) ...[
                            SizedBox(width: 85),
                            _titleSection_rightSide(),
                          ],
                        ],
                      ),
                    ),
                    // -----------------------------------------------------------------------------------------------------------------------------------------------
                    // Our Service Section
                    // -----------------------------------------------------------------------------------------------------------------------------------------------
                    SizedBox(height: 72),
                    _OurService_Section(),

                    // -----------------------------------------------------------------------------------------------------------------------------------------------
                    // Why Choose DOD Section
                    // -----------------------------------------------------------------------------------------------------------------------------------------------
                    _WhyChoose_DOD_Section(),
                    isMobile ? SizedBox(height: 50) : SizedBox(height: 154),

                    // -----------------------------------------------------------------------------------------------------------------------------------------------
                    // Our Clients Section
                    // -----------------------------------------------------------------------------------------------------------------------------------------------
                    _our_Clients_Section(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                isMobile
                                    ? SizedBox()
                                    : SizedBox(
                                      height:
                                          isMobile
                                              ? screenHeight * 2.5
                                              : screenHeight * 2.1,
                                      width: screenWidth,
                                      child:
                                          isMobile
                                              ? SizedBox.shrink()
                                              : Opacity(
                                                opacity: .8,
                                                child: Image.asset(
                                                  Imageconstants.backgrlogo,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                    ),
                              ],
                            ),
                            Column(
                              children: [
                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                                // What our Client Say
                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                                _what_our_client_Say_Section(context),
                                isMobile
                                    ? SizedBox(height: 50)
                                    : SizedBox(height: 150),

                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                                // FAQ Section
                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                                FAQSection(),
                                isMobile
                                    ? SizedBox(height: 50)
                                    : SizedBox(height: 150),

                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                                // Get in touch method
                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                                _Get_in_touch_Method(context),
                                isMobile
                                    ? SizedBox(height: 50)
                                    : SizedBox(height: 150),

                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                                // Footer method
                                // -----------------------------------------------------------------------------------------------------------------------------------------------
                              ],
                            ),
                          ],
                        ),
                        _Footer_method(context),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // Home Section : Laptop
  // For Mobile View check Mobilehomescreen()
  // -----------------------------------------------------------------------------------------------------------------------------------------------

  Widget _titleSection_leftSide(
    BuildContext context,
    bool isMobile,
    GlobalKey _homesession,
  ) {
    return Container(
      key: _homesession,
      decoration:
          isMobile
              ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Imageconstants.titleImg1),
                  fit: BoxFit.cover,
                ),
              )
              : null,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 0,
        vertical: isMobile ? 30 : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ...rest of the widget code

          // Top Counter
          Container(
            height: isMobile ? 80 : 130,
            child: Stack(
              children: [
                Row(
                  children: [
                    Text(
                      "5000",
                      maxLines: 1,
                      style: GoogleFonts.dmSans(
                        fontSize: isMobile ? 40 : 80,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colorconstants.maingrey,
                            offset: Offset(2, 2),
                          ),
                        ],
                        foreground:
                            Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colorconstants.mainBlue,
                      ),
                    ),
                    Text(
                      "+ ",
                      style: GoogleFonts.openSans(
                        fontSize: isMobile ? 40 : 80,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colorconstants.maingrey,
                            offset: Offset(2, 2),
                          ),
                        ],
                        foreground:
                            Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colorconstants.mainBlue,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 6,
                  left: 0,
                  child: Transform.rotate(
                    angle: -3 * pi / 180,
                    child: Container(
                      color: Colorconstants.mainBlue,
                      child: Text(
                        " Rides Completed! ",
                        style: GoogleFonts.dmSans(
                          color: Colorconstants.softOrange,
                          fontSize: isMobile ? 16 : 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: isMobile ? 8 : 4),

          // Heading
          RichText(
            text: TextSpan(
              text: "Your Ride, Your Way\n",
              style: GoogleFonts.dmSans(
                fontSize: isMobile ? 30 : 80,
                color: Colorconstants.mainBlue,
                fontWeight: FontWeight.w900,
              ),
              children: [
                TextSpan(
                  text: "Anytime, Anywhere!",
                  style: GoogleFonts.dmSans(
                    fontSize: isMobile ? 30 : 80,
                    color: Colorconstants.pineBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: isMobile ? 12 : 26),

          // Description
          Text(
            "Experience hassle-free rides with DOD, your go-to\nprofessional driver service for business and personal\nneeds.",
            style: GoogleFonts.dmSans(
              color: Colorconstants.pineBlack,
              fontSize: isMobile ? 16 : 30.56,
            ),
          ),

          SizedBox(height: isMobile ? 20 : 26),

          // Buttons
          isMobile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(height: 12),
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
                    buttonText: " Call Now ",
                    buttonColor: Colorconstants.white,
                    textColor: Colorconstants.mainBlue,
                    buttonborderColor: Colorconstants.mainBlue,
                  ),
                ],
              )
              : Row(
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
                  SizedBox(width: 33),
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
                    buttonText: " Call Now ",
                    buttonColor: Colorconstants.white,
                    textColor: Colorconstants.mainBlue,
                    buttonborderColor: Colorconstants.mainBlue,
                  ),
                ],
              ),
        ],
      ),
    );
  }

  Widget _titleSection_rightSide() {
    return Container(
      child: Lottie.asset(Animationconstants.dod_heroanijs),
      //     child: Stack(
      //       children: [
      //         Image.asset(Imageconstants.titleImg1),

      //         Positioned(
      //           left: 40,
      //           top: -60,
      //           child: Image.asset(
      //             Imageconstants.titleImg2,
      //             height: 485,
      //             width: 350,
      //           ),
      //         ),

      //         Positioned(
      //           bottom: 28,
      //           child: Image.asset(Imageconstants.titleImg3, height: 485),
      //         ),
      //       ],
      //     ),
      //     height: 570,
      //     width: 425,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180)),
      //     ),
    );
  }

  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // our Service Section Widget + each service items
  // -----------------------------------------------------------------------------------------------------------------------------------------------
  Widget _OurService_Section() {
    return LayoutBuilder(
      key: widget.serviceKey,
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isMobileView = screenWidth < 1100;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobileView ? 0 : 111),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child:
                    isMobileView
                        ? Titlemobile(
                          first_text: "Our",
                          second_text: "Services",
                        )
                        : titleWidget(
                          height: isMobileView ? 143 : 180,
                          toptitle: "Our",
                          bottomTitle: "Services",
                          fontsize: isMobileView ? 60 : 80,
                        ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobileView ? 16 : 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildServiceItem(
                      isMobileView: isMobileView,
                      imagePath: Imageconstants.service_Pro_Driver,
                      heading: "On-Demand Professional Drivers",
                      content:
                          "Our skilled and experienced chauffeurs are available 24/7 to provide reliable and safe driving services",
                      serviceNum: "01 ",
                      reverse: false,
                    ),
                    _buildServiceItem(
                      isMobileView: isMobileView,
                      imagePath: Imageconstants.service_Corporate_Driver,
                      heading: "Corporate Driver Solutions",
                      content:
                          "DOD specializes in offering professional drivers to corporate clients, ensuring that executives and employees experience stress-free, comfortable, and timely transportation",
                      serviceNum: "02 ",
                      reverse: true,
                    ),
                    _buildServiceItem(
                      isMobileView: isMobileView,
                      imagePath: Imageconstants.service_Hospital_Dri,
                      heading: "Hospital Assistance",
                      content:
                          "Hospital visits can be stressful. DOD provides reliable, safe rides for appointments, emergencies, and drop-offs—ensuring timely, caring service.",
                      serviceNum: "03 ",
                      reverse: false,
                    ),
                    _buildServiceItem(
                      isMobileView: isMobileView,
                      imagePath: Imageconstants.service_Carpickup_Driver,
                      heading: "Car Pickup & Drop Service",
                      content:
                          "DOD offers a hassle-free car pickup and drop service, allowing you to get your vehicle transported to your desired location safely and efficiently",
                      serviceNum: "04 ",
                      reverse: true,
                    ),
                    _buildServiceItem(
                      isMobileView: isMobileView,
                      imagePath: Imageconstants.service_Designated_Driver,
                      heading: "Designated Driver Service",
                      content:
                          "Enjoy your evenings without worrying about the drive home. Our designated driver service ensures that you and your vehicle reach home safely after a night out",
                      serviceNum: "05 ",
                      reverse: false,
                    ),
                    SizedBox(height: isMobileView ? 80 : 140),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceItem({
    required bool isMobileView,
    required String imagePath,
    required String heading,
    required String content,
    required String serviceNum,
    required bool reverse,
  }) {
    if (isMobileView) {
      return Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            SvgPicture.asset(imagePath),
            SizedBox(height: 20),
            servicesRectbox(
              heading: heading,
              content: content,
              serviceNum: serviceNum,
            ),
          ],
        ),
      );
    }

    // Desktop / Tablet layout
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            reverse
                ? [
                  SvgPicture.asset(imagePath),
                  SizedBox(width: 100),
                  ConstrainedBox(constraints: BoxConstraints(minWidth: 120)),
                  servicesRectbox(
                    heading: heading,
                    content: content,
                    serviceNum: serviceNum,
                  ),
                ]
                : [
                  servicesRectbox(
                    heading: heading,
                    content: content,
                    serviceNum: serviceNum,
                  ),
                  SizedBox(width: 100),
                  ConstrainedBox(constraints: BoxConstraints(minWidth: 90)),
                  SvgPicture.asset(imagePath),
                ],
      ),
    );
  }

  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // Why Choose DOD Section
  // -----------------------------------------------------------------------------------------------------------------------------------------------
  Widget _WhyChoose_DOD_Section() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final bool isSmallScreen = screenWidth < 1100;

        final double fontSize = isSmallScreen ? 18 : 30;
        final double imageHeight = isSmallScreen ? 80 : 120;
        final double verticalSpacing = isSmallScreen ? 40 : 101;
        final EdgeInsets containerPadding =
            isSmallScreen
                ? EdgeInsets.symmetric(horizontal: 16, vertical: 24)
                : EdgeInsets.only(left: 111, top: 43);

        return Stack(
          children: [
            Container(
              height: isSmallScreen ? null : 632, // Auto height on small screen
              width: double.infinity,
              color: Colorconstants.mainBlue,
              child: Padding(
                padding: containerPadding,
                child: Column(
                  crossAxisAlignment:
                      isSmallScreen
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                  children: [
                    isSmallScreen
                        ? Titlemobile(
                          midColor: Colorconstants.mainBlue,
                          isTwoLine: true,
                          first_text: "Why Choose",
                          second_text: "DOD ?",
                          first_color: Colorconstants.softOrange,
                          second_color: Colorconstants.softOrange,
                        )
                        : titleWidget(
                          width: isSmallScreen ? 320 : 580,
                          toptitle: "Why",
                          topshadowcolor: Colorconstants.mainBlue,
                          topbordercolor: Colorconstants.softOrange,
                          bottomTitle: "Choose DOD ?",
                          bottomColor: Colorconstants.softOrange,
                          bordercolor: Colorconstants.softOrange,
                          fontsize: isSmallScreen ? 44 : 80,
                          height: isSmallScreen ? 115 : 180,
                        ),
                    SizedBox(height: verticalSpacing),
                    isSmallScreen
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Imageconstants.prodrivers,
                                  height: imageHeight,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Professional and \nExperienced Drivers",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                    color: Colorconstants.white,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Imageconstants.alltimesupport,
                                  height: imageHeight,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "24/7 Customer \nSupport",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                    color: Colorconstants.white,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Imageconstants.affordable_rates,
                                  height: imageHeight,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Affordable \nRates",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                    color: Colorconstants.white,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Imageconstants.convinient_booking,
                                  height: imageHeight,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  "Convenient \nBooking",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.dmSans(
                                    color: Colorconstants.white,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                          ],
                        )
                        : Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Imageconstants.prodrivers,
                                    height: imageHeight,
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Professional and \nExperienced Drivers",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      color: Colorconstants.white,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Imageconstants.alltimesupport,
                                    height: imageHeight,
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "24/7 Customer \nSupport",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      color: Colorconstants.white,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Imageconstants.affordable_rates,
                                    height: imageHeight,
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Affordable \nRates",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      color: Colorconstants.white,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Imageconstants.convinient_booking,
                                    height: imageHeight,
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Convenient \nBooking",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.dmSans(
                                      color: Colorconstants.white,
                                      fontSize: fontSize,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
              ),
            ),

            // Logo image at full height
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  Imageconstants.why_dod,
                  height: isSmallScreen ? null : 632,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // Client Section - logoes of Clients are displayed using this section
  // -----------------------------------------------------------------------------------------------------------------------------------------------
  Widget _our_Clients_Section() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final bool isSmallScreen = screenWidth < 1100;

        final double fontSize = isSmallScreen ? 18 : 30;
        final double imageHeight = isSmallScreen ? 80 : 120;
        final double verticalSpacing = isSmallScreen ? 40 : 101;
        final EdgeInsets containerPadding =
            isSmallScreen
                ? EdgeInsets.symmetric(horizontal: 16, vertical: 24)
                : EdgeInsets.only(left: 111, top: 43);

        return isSmallScreen
            ? Column(
              children: [
                Titlemobile(first_text: "Our", second_text: "Clients"),
                const SizedBox(height: 50),

                CarouselSlider(
                  items: [
                    clientsLogoWidget(image: Imageconstants.client1),
                    clientsLogoWidget(image: Imageconstants.client2),

                    // Add more logos as needed
                  ],
                  options: CarouselOptions(
                    height: 100,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enlargeCenterPage: false,
                    viewportFraction: 1, // Adjust based on logo size
                    pauseAutoPlayOnTouch: true,
                    pauseAutoPlayInFiniteScroll: false,
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                SizedBox(height: 60),
              ],
            )
            : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleHeadingtwoWidget(
                  leftHeading: "Our ",
                  rightHeading: "Clients",
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    clientsLogoWidget(image: Imageconstants.client1),
                    clientsLogoWidget(image: Imageconstants.client2),
                  ],
                ),
                SizedBox(height: 150),
              ],
            );
      },
    );
  }

  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // Customer Review Section
  // -----------------------------------------------------------------------------------------------------------------------------------------------
  Widget _what_our_client_Say_Section(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    // final screenHeight = MediaQuery.sizeOf(context).height;
    final isMobile = screenWidth < 1100;

    final List<Map<String, dynamic>> reviews = [
      {
        "content":
            "We used Driver on Demand (DoD) while our staff was on leave and were genuinely impressed. The drivers were punctual, professional, and efficient. Their support made a busy time much easier. Highly recommended!",

        "by": "Lora Mattress Pvt.Ltd",
        "avatar": "assets/images/review_lora.jpg",
        "date": "12/10/2024",
        "bgGradient": LinearGradient(
          colors: [Color(0xFFE0C3FC), Color(0xFF8EC5FC)], // Soft violet to blue
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        "fontColor": Color(0xFF1B1B1B),
      },
      {
        "content":
            "DOD has been a lifesaver! I had to take my Grand Parents to the hospital for regular checkups, and the driver was not only punctual but also very caring. It’s more than just a driving service – it’s personal assistance at its best!",
        "by": "Matthews John",
        "avatar": "assets/images/review_mathews.jpg",
        "date": "12/10/2024",
        "bgGradient": LinearGradient(
          colors: [Color(0xFFE0C3FC), Color(0xFF8EC5FC)], // Soft violet to blue
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        "fontColor": Color(0xFF1B1B1B),
      },
      {
        "content":
            "I often travel for work and need airport pickups at odd hours. DOD has never let me down. The booking is easy, the drivers are professional, and the pricing is very reasonable. Highly recommended!",
        "by": "Syed Ameen",
        "avatar": "assets/images/review_syed.jpg",
        "date": "24/01/2025",
        "bgGradient": LinearGradient(
          colors: [Color(0xFFFAD0C4), Color(0xFFFFD1FF)], // Peach to pink
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        "fontColor": Color(0xFF303030),
      },
      {
        "content":
            "I had a wedding outstation, and I didn’t want to drive that far. Booked a driver via DOD, and the entire trip was smooth and stress-free. Their service is super helpful and the customer support is available 24x7.",
        "by": "Tom Thomas",
        "avatar": "assets/images/review_tom.jpg",
        "date": "01/03/2025",
        "bgGradient": LinearGradient(
          colors: [Color(0xFFB2FEFA), Color(0xFF0ED2F7)], // Aqua shades
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        "fontColor": Color(0xFF0A0A0A),
      },
    ];

    void _previousPage() {
      if (_currentPage > 0) {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    void _nextPage() {
      if (_currentPage < reviews.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 109),
              child:
                  isMobile
                      ? SizedBox()
                      : Row(
                        children: [
                          Image.asset(Imageconstants.clientreview),
                          SizedBox(width: screenWidth / 15),
                          Container(
                            height: 400,
                            width: screenWidth / 2.5,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 190),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "What Our",
                                        style: GoogleFonts.dmSans(
                                          fontSize: 80,
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
                                                ..color =
                                                    Colorconstants.mainBlue
                                                ..style = PaintingStyle.stroke,
                                        ),
                                      ),
                                      SizedBox(height: 100),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 70,
                                  child: Text(
                                    "Client Say ?",
                                    style: GoogleFonts.dmSans(
                                      color: Colorconstants.mainBlue,
                                      fontSize: 80,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            ),
            SizedBox(height: isMobile ? 100 : 250),
          ],
        ),
        isMobile
            ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Titlemobile(
                    fontsize: 36,
                    first_text: "What Our",
                    second_text: "Client Say?",
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height:
                        isMobile
                            ? 500
                            : 450, // slightly increased to fit content
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeCenterPage: true,
                    viewportFraction: 0.85,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items:
                      reviews.map((review) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InstagramStyleReviewCard(
                              reviewer: review['by']!,
                              content: review['content']!,
                              avatarImagePath: review['avatar']!,
                              date: review['date']!,
                              backgroundGradient: review['bgGradient'],
                              fontColor: review['fontColor'],
                            );
                          },
                        );
                      }).toList(),
                ),
              ],
            )
            : Positioned(
              top: 300,
              left: null,
              right: 200,
              child: Stack(
                children: [
                  Container(
                    width: screenWidth / 1.6,
                    height: 327,
                    color: Colorconstants.transparent,
                  ),
                  Positioned(
                    left: 30,
                    child: Container(
                      width: screenWidth / 1.7,
                      height: 327,
                      decoration: BoxDecoration(
                        color: Colorconstants.white,
                        border: Border.all(
                          color: Colorconstants.mainBlue,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder:
                            (context, index) => reviewCarousalWidget(
                              reviewContent: reviews[index]["content"]!,
                              reviewedBy: reviews[index]["by"]!,
                            ),
                        itemCount: reviews.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  if (!isMobile) ...[
                    Positioned(
                      top: 140,
                      child: Container(
                        height: 60,
                        width: 58,
                        decoration: BoxDecoration(
                          color: Colorconstants.mainBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colorconstants.softOrange,
                            ),
                          ),
                          onPressed: _previousPage,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 140,
                      child: Container(
                        height: 60,
                        width: 58,
                        decoration: BoxDecoration(
                          color: Colorconstants.mainBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colorconstants.softOrange,
                            ),
                          ),
                          onPressed: _nextPage,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
      ],
    );
  }

  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // Get In Touch Section : To contact Us using whatsapp
  // -----------------------------------------------------------------------------------------------------------------------------------------------
  Widget _Get_in_touch_Method(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1100;

    return Container(
      key: widget.businessKey,
      height: isMobile ? 500 : 301,
      width: screenWidth / (isMobile ? 1.05 : 1.25),
      decoration: BoxDecoration(
        color: Colorconstants.white,
        borderRadius: BorderRadius.circular(50),
        image:
            isMobile
                ? DecorationImage(
                  image: AssetImage(Imageconstants.getintouch),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                )
                : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child:
            isMobile
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Titlemobile(
                      first_text: "Connect ",
                      second_text: "With Us",
                      fontsize: 38,
                      isunderline: screenWidth >= 540 ? true : false,
                    ),
                    const SizedBox(height: 30),
                    ButtonWidget(
                      onPressed: () {
                        launchWhatsApp(
                          phone: "919731907858",
                          message:
                              "*Hi, I would like to hire a driver. Please assist me with the process.*",
                        );
                      },
                      buttonText: "Hire Drivers for B2B",
                      buttonColor: Colorconstants.mainBlue,
                      textColor: Colorconstants.white,
                      buttonborderColor: Colorconstants.mainBlue,
                    ),
                    const SizedBox(height: 20),
                    ButtonWidget(
                      onPressed: () {
                        launchWhatsApp(
                          phone: "919731907858",
                          message:
                              "*Hi, I am interested in joining as a driver partner. Please share the details.*",
                        );
                      },
                      buttonText: "Join us as a driver \n partner",
                      fontsize: 18,
                      buttonColor: Colorconstants.white,
                      textColor: Colorconstants.mainBlue,
                      buttonborderColor: Colorconstants.mainBlue,
                    ),
                  ],
                )
                : Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        Imageconstants.getintouch,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleHeadingtwoWidget(
                          fontSize: 70,
                          leftHeading: "Get In ",
                          rightHeading: "Touch With Us",
                        ),
                        const SizedBox(height: 30),
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
                              buttonText: "Hire Drivers for B2B",
                              buttonColor: Colorconstants.mainBlue,
                              textColor: Colorconstants.white,
                              buttonborderColor: Colorconstants.mainBlue,
                            ),
                            const SizedBox(width: 30),
                            ButtonWidget(
                              onPressed: () {
                                launchWhatsApp(
                                  phone: "919731907858",
                                  message:
                                      "*Hi, I am interested in joining as a driver partner. Please share the details.*",
                                );
                              },
                              buttonText: "Join us as a driver partner",
                              buttonColor: Colorconstants.white,
                              textColor: Colorconstants.mainBlue,
                              buttonborderColor: Colorconstants.mainBlue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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

  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // Footer Section
  // -----------------------------------------------------------------------------------------------------------------------------------------------
  Widget _Footer_method(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1100;

    Text _footerSectionHeader(String text) {
      return Text(
        text,
        style: GoogleFonts.dmSans(
          color: Colorconstants.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    Text _footerText(String text, {TextAlign align = TextAlign.left}) {
      return Text(
        text,
        style: GoogleFonts.dmSans(color: Colorconstants.white, fontSize: 16),
        textAlign: align,
      );
    }

    return Container(
      key: widget.aboutKey,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      color: Colorconstants.mainBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isMobile) ...[
            Center(
              child: Image.asset(
                Imageconstants.foot_logo,
                fit: BoxFit.contain,
                width: screenWidth / 1.6,
              ),
            ),
            const SizedBox(height: 30),
            _footerSectionHeader("Office"),
            _footerText(
              "Thenassaril 126/2B, Mannathoor P.O\nNavolimattam, Muvattupuzha\nErnakulam, Kerala - 686667",
              align: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _footerSectionHeader("Phone"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colorconstants.softOrange,
                  child: const Icon(Icons.add_ic_call_outlined, size: 16),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    final String phoneNumber = "+917907538061";
                    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: _footerText("+91 79075 38061"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _footerSectionHeader("Email"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colorconstants.softOrange,
                  child: const Icon(Icons.email, size: 16),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'dodexecutive@gmail.com',
                      query: Uri.encodeFull(
                        'subject=Enquiry&body=Hello DOD Team,',
                      ),
                    );

                    if (await canLaunchUrl(emailLaunchUri)) {
                      await launchUrl(
                        emailLaunchUri,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      debugPrint('Could not launch $emailLaunchUri');
                    }
                  },
                  child: _footerText("dodexecutive@gmail.com"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _footerSectionHeader("Follow us on"),
            const SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                InkWell(
                  onTap: () async {
                    final Uri urlyt = Uri.parse(
                      'https://www.facebook.com/share/18Lwy9gYVi/',
                    );
                    if (await canLaunchUrl(urlyt)) {
                      isMobile
                          ? await launchUrl(urlyt)
                          : launchUrl(
                            urlyt,
                            mode: LaunchMode.externalApplication,
                          );
                    } else {
                      throw 'could not launch DOD Facebook';
                    }
                  },
                  child: Image.asset(Imageconstants.fblogo, width: 30),
                ),
                InkWell(
                  onTap: () async {
                    final Uri urlyt = Uri.parse(
                      'https://www.instagram.com/dod_.india?igsh=MXhqaWg4MnA2ZmRkOA==',
                    );
                    if (await canLaunchUrl(urlyt)) {
                      isMobile
                          ? await launchUrl(urlyt)
                          : launchUrl(
                            urlyt,
                            mode: LaunchMode.externalApplication,
                          );
                    } else {
                      throw 'could not launch DOD Instagram';
                    }
                  },
                  child: Image.asset(Imageconstants.instalogo, width: 30),
                ),
                InkWell(
                  onTap: () async {
                    final Uri urlyt = Uri.parse(
                      'https://www.linkedin.com/company/dod-india/',
                    );
                    if (await canLaunchUrl(urlyt)) {
                      isMobile
                          ? await launchUrl(urlyt)
                          : launchUrl(
                            urlyt,
                            mode: LaunchMode.externalApplication,
                          );
                    } else {
                      throw 'could not launch DOD LinkedIn';
                    }
                  },
                  child: Image.asset(Imageconstants.linkedInlogo, width: 30),
                ),
                InkWell(
                  onTap: () async {
                    final Uri urlyt = Uri.parse(
                      'https://www.youtube.com/@DODIndia',
                    );
                    if (await canLaunchUrl(urlyt)) {
                      isMobile
                          ? await launchUrl(urlyt)
                          : launchUrl(
                            urlyt,
                            mode: LaunchMode.externalApplication,
                          );
                    } else {
                      throw 'could not launch DOD YouTube';
                    }
                  },
                  child: Image.asset(Imageconstants.youtubelogo, width: 30),
                ),
                InkWell(
                  onTap: () {
                    launchWhatsApp(
                      phone: "919731907858",
                      message:
                          "*Hi, I’d like to know more about DOD India and the services you offer. Could you please assist me with the details?*",
                    );
                  },
                  child: Image.asset(Imageconstants.whatsapplogo, width: 30),
                ),
              ],
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Imageconstants.foot_logo, width: 200),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _footerSectionHeader("Office"),
                      _footerText(
                        "Thenassaril 126/2, Mannathoor P.O\nNavolimattam, Muvattupuzha\nErnakulam, Kerala - 686667",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _footerSectionHeader("Phone"),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colorconstants.softOrange,
                            child: const Icon(
                              Icons.add_ic_call_outlined,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              final String phoneNumber = "+917907538061";
                              final Uri url = Uri(
                                scheme: 'tel',
                                path: phoneNumber,
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: _footerText("+91 79075 38061"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _footerSectionHeader("Email"),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colorconstants.softOrange,
                            child: const Icon(Icons.email, size: 16),
                          ),
                          const SizedBox(width: 10),

                          InkWell(
                            onTap: () async {
                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'dodexecutive@gmail.com',
                                query: Uri.encodeFull(
                                  'subject=Enquiry&body=Hello DOD Team,',
                                ),
                              );

                              if (await canLaunchUrl(emailLaunchUri)) {
                                await launchUrl(
                                  emailLaunchUri,
                                  mode: LaunchMode.externalApplication,
                                );
                              } else {
                                debugPrint('Could not launch $emailLaunchUri');
                              }
                            },
                            child: _footerText("dodexecutive@gmail.com"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _footerSectionHeader("Follow us on"),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              final Uri urlyt = Uri.parse(
                                'https://www.facebook.com/share/18Lwy9gYVi/',
                              );
                              if (await canLaunchUrl(urlyt)) {
                                isMobile
                                    ? await launchUrl(urlyt)
                                    : launchUrl(
                                      urlyt,
                                      mode: LaunchMode.externalApplication,
                                    );
                              } else {
                                throw 'could not launch DOD Facebook';
                              }
                            },
                            child: Image.asset(
                              Imageconstants.fblogo,
                              width: 33,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              final Uri urlyt = Uri.parse(
                                'https://www.instagram.com/dod_.india?igsh=MXhqaWg4MnA2ZmRkOA==',
                              );
                              if (await canLaunchUrl(urlyt)) {
                                isMobile
                                    ? await launchUrl(urlyt)
                                    : launchUrl(
                                      urlyt,
                                      mode: LaunchMode.externalApplication,
                                    );
                              } else {
                                throw 'could not launch DOD Instagram';
                              }
                            },
                            child: Image.asset(
                              Imageconstants.instalogo,
                              width: 33,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              final Uri urlyt = Uri.parse(
                                'https://www.linkedin.com/company/dod-india/',
                              );
                              if (await canLaunchUrl(urlyt)) {
                                isMobile
                                    ? await launchUrl(urlyt)
                                    : launchUrl(
                                      urlyt,
                                      mode: LaunchMode.externalApplication,
                                    );
                              } else {
                                throw 'could not launch DOD LinkedIn';
                              }
                            },
                            child: Image.asset(
                              Imageconstants.linkedInlogo,
                              width: 33,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              final Uri urlyt = Uri.parse(
                                'https://www.youtube.com/@DODIndia',
                              );
                              if (await canLaunchUrl(urlyt)) {
                                isMobile
                                    ? await launchUrl(urlyt)
                                    : launchUrl(
                                      urlyt,
                                      mode: LaunchMode.externalApplication,
                                    );
                              } else {
                                throw 'could not launch DOD YouTube';
                              }
                            },
                            child: Image.asset(
                              Imageconstants.youtubelogo,
                              width: 33,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              launchWhatsApp(
                                phone: "919731907858",
                                message:
                                    "*Hi, I’d like to know more about DOD India and the services you offer. Could you please assist me with the details?*",
                              );
                            },
                            child: Image.asset(
                              Imageconstants.whatsapplogo,
                              width: 33,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 40),
          Container(
            height: 1,
            width: screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colorconstants.mainBlue,
                  Colorconstants.white,
                  Colorconstants.mainBlue,
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "© 2025, DOD All Rights Reserved | ",
              style: GoogleFonts.dmSans(
                color: Colorconstants.white,
                fontSize: 15,
              ),
              children: [
                TextSpan(
                  text: "Terms and Conditions | ",
                  style: GoogleFonts.dmSans(
                    color: Colorconstants.white,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: GoogleFonts.dmSans(
                    color: Colorconstants.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "Developed by Esio Technologies",
                style: TextStyle(color: Colorconstants.white, fontSize: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class reviewCarousalWidget extends StatelessWidget {
  reviewCarousalWidget({
    super.key,
    required this.reviewContent,
    required this.reviewedBy,
    this.fontsize = 24,
    this.fontcolor = Colorconstants.black,
  });

  final String reviewContent;
  final String reviewedBy;
  final double fontsize;
  final Color fontcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(45.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                reviewContent,
                style: GoogleFonts.dmSans(color: fontcolor, fontSize: fontsize),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reviewedBy,
                style: GoogleFonts.dmSans(
                  color: fontcolor,
                  fontSize: fontsize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SvgPicture.asset(Imageconstants.dialogue_image),
            ],
          ),
        ],
      ),
    );
  }
}

class backgroundLinesWidget extends StatelessWidget {
  const backgroundLinesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(30, (index) {
        return Positioned(
          left: index * 100.0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 1,
            color: Colorconstants.mainBlue.withValues(alpha: 0.1),
          ),
        );
      }),
    );
  }
}
