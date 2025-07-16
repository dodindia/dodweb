import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dod_web/utils/Color_constants/colorconstants.dart';

class InstagramStyleReviewCard extends StatelessWidget {
  final String reviewer;
  final String content;
  final String avatarImagePath; // local asset or network image
  final String date;
  final Color fontColor;
  final LinearGradient backgroundGradient;

  InstagramStyleReviewCard({
    super.key,
    required this.reviewer,
    required this.content,
    required this.avatarImagePath,
    required this.date,
    this.backgroundGradient = const LinearGradient(
      colors: [Color(0xFFB2FEFA), Color(0xFF0ED2F7)],
    ),

    this.fontColor = Colorconstants.black,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isSmallerMobile = screenWidth < 380;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 450,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colorconstants.white,

          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colorconstants.mainBlue.withAlpha(80),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar + Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(avatarImagePath),
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 12),
                    Text(
                      reviewer,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: isSmallerMobile ? 17 : 19,
                        color: Colorconstants.black,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.more_vert, color: Colorconstants.black),
              ],
            ),

            const SizedBox(height: 12),

            Divider(
              color: Colorconstants.mainBlue.withAlpha(100),
              thickness: 1,
            ),

            SizedBox(height: 16),

            // Expanded review content to fill available vertical space
            Expanded(
              child: Container(
                width: double.infinity,

                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: backgroundGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: GoogleFonts.dmSans(
                      fontSize: isSmallerMobile ? 16 : 18,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Date & Like
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colorconstants.red,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Like",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: Colorconstants.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  date,
                  style: GoogleFonts.dmSans(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
