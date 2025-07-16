import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:dod_web/utils/Image_constants/imageconstants.dart';
import 'package:dod_web/view/home_Screen/homeScreenBody.dart';
import 'package:dod_web/view/home_Screen/widgets/ButtonWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool showMenu = false;
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _businessKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200 && !_showScrollToTop) {
        setState(() => _showScrollToTop = true);
      } else if (_scrollController.offset <= 300 && _showScrollToTop) {
        setState(() => _showScrollToTop = false);
      }
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final isMobile = screenWidth < 1100;
          final isTablet = screenWidth >= 1100 && screenWidth < 1200;
          final isSmallDesktop = screenWidth >= 1200 && screenWidth < 1440;
          final isLargeDesktop = screenWidth >= 1440;

          return Column(
            children: [
              _AppbarSection(
                context,
                isMobile,
                isTablet,
                isSmallDesktop,
                isLargeDesktop,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: homeScreenBody(
                        scrolltoTop: _scrollToTop,
                        showScrollToTop: _showScrollToTop,
                        scrollController: _scrollController,
                        homeKey: _homeKey,
                        serviceKey: _servicesKey,
                        businessKey: _businessKey,
                        aboutKey: _aboutKey,
                      ),
                    ),
                    if (_showScrollToTop)
                      Positioned(
                        right: 20,
                        bottom: 30,
                        child: FloatingActionButton(
                          onPressed: _scrollToTop,
                          backgroundColor: Colorconstants.mainBlue,
                          shape: CircleBorder(),
                          tooltip: 'Scroll to Top',
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colorconstants.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _AppbarSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    bool isSmallDesktop,
    bool isLargeDesktop,
  ) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                isMobile
                    ? 20
                    : isTablet
                    ? 50
                    : 105,
            vertical: isMobile ? 16 : 34,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(
              //   Imageconstants.dodsvg,
              //   height: isMobile ? 40 : 53,
              //   width: isMobile ? 120 : 166.91,
              // ),
              SvgPicture.asset(
                Imageconstants.dodlogo,
                height: isMobile ? 40 : 53,
                width: isMobile ? 120 : 166.91,
                colorFilter: ColorFilter.mode(
                  Colorconstants
                      .mainBlue, // Your desired color (e.g. dark blue)
                  BlendMode.srcIn,
                ),
              ),
              if (!isMobile)
                Row(children: _navItems())
              else
                IconButton(
                  icon: Icon(Icons.menu, color: Colorconstants.mainBlue),
                  onPressed: () {
                    setState(() {
                      showMenu = !showMenu;
                    });
                  },
                ),
            ],
          ),
        ),

        if (showMenu && MediaQuery.of(context).size.width < 1200)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  _navItems()
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: item,
                        ),
                      )
                      .toList(),
            ),
          ),

        Container(
          height: 2,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colorconstants.white,
                Colorconstants.mainBlue,
                Colorconstants.mainBlue,
                Colorconstants.mainBlue,
                Colorconstants.white,
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _navItems() {
    return [
      InkWell(onTap: () => _scrollToSection(_homeKey), child: _navText("Home")),
      SizedBox(width: 20),
      InkWell(
        onTap: () => _scrollToSection(_servicesKey),
        child: _navText("Services"),
      ),
      SizedBox(width: 20),
      InkWell(
        onTap: () => _scrollToSection(_businessKey),
        child: _navText("For Business"),
      ),
      SizedBox(width: 20),
      InkWell(
        onTap: () => _scrollToSection(_aboutKey),
        child: _navText("About Us"),
      ),
      SizedBox(width: 20),
      ButtonWidget(
        onPressed: () {
          launchWhatsApp(
            phone: "919731907858",
            message:
                "*Hi, I would like to hire a driver. Please assist me with the process.*",
          );
        },
        buttonText: "Book Your Ride Now",
        buttonColor: Colorconstants.mainBlue,
        textColor: Colorconstants.white,
      ),
    ];
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

  Widget _navText(String text) {
    return Text(
      text,
      style: GoogleFonts.ibmPlexMono(color: Colorconstants.black, fontSize: 18),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      final box = targetContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(
        Offset.zero,
        ancestor: context.findRenderObject(),
      );
      final offset = position.dy + _scrollController.offset;

      // Adjust for fixed AppBar height
      double appBarHeight = MediaQuery.of(context).size.width < 1100 ? 90 : 120;

      _scrollController.animateTo(
        offset - appBarHeight,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }

    // Hide mobile menu if open
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 1200 && showMenu) {
      setState(() {
        showMenu = false;
      });
    }
  }
}
