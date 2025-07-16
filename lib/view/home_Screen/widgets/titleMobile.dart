import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dod_web/utils/Color_constants/colorconstants.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:dod_web/utils/Color_constants/colorconstants.dart';

class Titlemobile extends StatefulWidget {
  Titlemobile({
    super.key,
    required this.first_text,
    required this.second_text,
    this.first_color = Colorconstants.mainBlue,
    this.second_color = Colorconstants.black,
    this.isTwoLine = false,
    this.isunderline = true,
    this.midColor = Colorconstants.softOrange,
    this.fontsize = 40,
  });

  final String first_text;
  final String second_text;
  final Color first_color;
  final Color second_color;
  final Color midColor;
  double fontsize;

  bool isTwoLine;
  bool isunderline;
  @override
  State<Titlemobile> createState() => _TitlemobileState();
}

class _TitlemobileState extends State<Titlemobile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shakeController;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -0.01),
      end: const Offset(0, 0.01),
    ).animate(CurvedAnimation(parent: _shakeController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isSmallerMobile = screenWidth < 400;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Title text (shaking and shimmering)
          widget.isTwoLine
              ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ShimmeringShakingText(
                    fontsize: isSmallerMobile ? 28 : widget.fontsize,
                    midColor: widget.midColor,
                    text: widget.first_text,
                    textColor: widget.first_color,
                    fontWeight: FontWeight.w900,
                  ),
                  const SizedBox(width: 8),
                  _ShimmeringShakingText(
                    fontsize: isSmallerMobile ? 28 : widget.fontsize,
                    midColor: widget.midColor,
                    text: widget.second_text,
                    textColor: widget.second_color,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              )
              : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ShimmeringShakingText(
                    fontsize: isSmallerMobile ? 28 : widget.fontsize,
                    midColor: widget.midColor,
                    text: widget.first_text,
                    textColor: widget.first_color,
                    fontWeight: FontWeight.w900,
                  ),
                  const SizedBox(width: 8),
                  _ShimmeringShakingText(
                    fontsize: isSmallerMobile ? 28 : widget.fontsize,
                    midColor: widget.midColor,
                    text: widget.second_text,
                    textColor: widget.second_color,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),

          const SizedBox(width: 12),

          // Shaking Underline that fills remaining space
          widget.isunderline
              ? Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: Container(
                      height: 5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: widget.first_color,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _ShimmeringShakingText extends StatefulWidget {
  _ShimmeringShakingText({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontWeight,
    required this.midColor,
    required this.fontsize,
  });

  final String text;
  final Color textColor;
  final Color midColor;
  final FontWeight fontWeight;
  double fontsize;
  @override
  State<_ShimmeringShakingText> createState() => _ShimmeringShakingTextState();
}

class _ShimmeringShakingTextState extends State<_ShimmeringShakingText>
    with TickerProviderStateMixin {
  late final AnimationController _shakeController;
  late final Animation<Offset> _shakeAnimation;

  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    // Shake: slower bounce
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _shakeAnimation = Tween<Offset>(
      begin: const Offset(0, -0.015),
      end: const Offset(0, 0.015),
    ).animate(CurvedAnimation(parent: _shakeController, curve: Curves.linear));

    // Shimmer controller
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _shakeController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _shakeAnimation,
      child: AnimatedBuilder(
        animation: _shimmerController,
        builder: (context, child) {
          final shimmerPosition =
              _shimmerController.value * 2 - 0.5; // from -0.5 to 1.5

          return ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [widget.textColor, widget.midColor, widget.textColor],
                stops: [
                  (shimmerPosition - 0.3).clamp(0.0, 1.0),
                  shimmerPosition.clamp(0.0, 1.0),
                  (shimmerPosition + 0.3).clamp(0.0, 1.0),
                ],
              ).createShader(bounds);
            },
            child: child,
          );
        },
        child: Text(
          widget.text,
          style: GoogleFonts.dmSans(
            fontSize: widget.fontsize,
            fontWeight: widget.fontWeight,
            color: Colors.white, // IMPORTANT for ShaderMask
          ),
        ),
      ),
    );
  }
}
