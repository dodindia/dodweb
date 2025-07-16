import 'package:flutter/material.dart';

class clientsLogoWidget extends StatelessWidget {
  clientsLogoWidget({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    bool isMobile = screenWidth < 1100;
    return Container(
      height: 100,
      width: isMobile ? 250 : 350,
      child: Image.asset(image, fit: BoxFit.contain),
    );
  }
}
