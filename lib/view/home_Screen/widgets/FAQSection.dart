import 'package:dod_web/utils/Color_constants/colorconstants.dart';
import 'package:dod_web/view/home_Screen/widgets/titleHeadingtwoWidget.dart';
import 'package:dod_web/view/home_Screen/widgets/titleMobile.dart';
import 'package:dod_web/view/home_Screen/widgets/titleWidget.dart';
import 'package:flutter/material.dart';

class FAQSection extends StatefulWidget {
  @override
  _FAQSectionState createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  final List<Map<String, String>> faqData = [
    {
      "question": "What areas do you serve?",
      "answer":
          "We currently serve across major cities and nearby areas. Please contact us to confirm availability in your location.",
    },
    {
      "question": "How do I make a booking?",
      "answer":
          "You can make a booking through our mobile app, website, or by calling our 24x7 customer support.",
    },
    {
      "question": "What if I cancel?",
      "answer":
          "Cancellations are allowed. However, charges may apply depending on the time of cancellation. Please refer to our cancellation policy for details.",
    },
    {
      "question": "Are your drivers background-verified?",
      "answer":
          "Yes. All our drivers go through a strict background verification and training process to ensure your safety.",
    },
  ];

  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1100;

    return Column(
      children: [
        isMobile
            ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Titlemobile(
                    first_text: "Frequently Asked",
                    second_text: "Question",
                    fontsize: 38,
                    isTwoLine: true,
                  ),
                ),
                SizedBox(height: 10),
              ],
            )
            : titleHeadingtwoWidget(
              leftHeading: "What People",
              rightHeading: " Usually Ask",
              fontSize: isMobile ? 24 : 70,
            ),
        Container(
          width: isMobile ? screenWidth * 0.95 : screenWidth * 0.8,
          padding: EdgeInsets.all(isMobile ? 8 : 16),
          child: SingleChildScrollView(
            child: ExpansionPanelList.radio(
              elevation: 3,
              dividerColor: Colorconstants.mainBlue,
              expandIconColor: Colorconstants.mainBlue,
              materialGapSize: 18,
              expandedHeaderPadding: EdgeInsets.symmetric(vertical: 4),
              animationDuration: Duration(milliseconds: 300),
              initialOpenPanelValue: _expandedIndex,
              children:
                  faqData.asMap().entries.map<ExpansionPanelRadio>((entry) {
                    int index = entry.key;
                    Map<String, String> faq = entry.value;

                    return ExpansionPanelRadio(
                      backgroundColor:
                          isMobile
                              ? Colorconstants.lightBlue
                              : Colorconstants.white,
                      value: index,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(
                            faq["question"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: isMobile ? 16 : 18,
                              color: Colorconstants.mainBlue,
                            ),
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          faq["answer"]!,
                          style: TextStyle(
                            color: Colorconstants.pineBlack,
                            fontSize: isMobile ? 13 : 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
