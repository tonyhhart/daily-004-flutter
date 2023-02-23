import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daily_004_flutter/theme/colors.dart';

enum UrbanistTextVariants { bodyXS, bodyMD, bodyLG, h3, h4, h5 }

TextStyle urbanistTextHeader3Style = GoogleFonts.urbanist(
    textStyle: TextStyle(
  color: grey900,
  fontWeight: FontWeight.w500,
  fontSize: 50,
));

TextStyle urbanistTextHeader4Style = GoogleFonts.urbanist(
    textStyle: TextStyle(
  color: grey900,
  fontWeight: FontWeight.w300,
  fontSize: 36,
));

TextStyle urbanistTextHeader5Style = GoogleFonts.urbanist(
    textStyle: TextStyle(
  color: grey900,
  fontWeight: FontWeight.w700,
  fontSize: 20,
));

TextStyle urbanistTextBodyXSStyle = GoogleFonts.urbanist(
    textStyle: TextStyle(
  color: grey900,
  fontWeight: FontWeight.w700,
  fontSize: 10,
));

TextStyle urbanistTextBodyMDStyle = GoogleFonts.urbanist(
    textStyle: TextStyle(
  color: grey900,
  fontWeight: FontWeight.w500,
  fontSize: 14,
));

TextStyle urbanistTextBodyLGStyle = GoogleFonts.urbanist(
    textStyle: TextStyle(
  color: grey900,
  fontWeight: FontWeight.w700,
  fontSize: 16,
));

class UrbanistText extends StatelessWidget {
  const UrbanistText(this.data, {super.key, this.variant, this.color});

  final String data;
  final UrbanistTextVariants? variant;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    switch (variant) {
      case UrbanistTextVariants.h3:
        textStyle = urbanistTextHeader3Style;
        break;
      case UrbanistTextVariants.h4:
        textStyle = urbanistTextHeader4Style;
        break;
      case UrbanistTextVariants.h5:
        textStyle = urbanistTextHeader5Style;
        break;
      case UrbanistTextVariants.bodyXS:
        textStyle = urbanistTextBodyXSStyle;
        break;
      case UrbanistTextVariants.bodyMD:
        textStyle = urbanistTextBodyMDStyle;
        break;
      case UrbanistTextVariants.bodyLG:
        textStyle = urbanistTextBodyLGStyle;
        break;
      default:
        textStyle = GoogleFonts.urbanist(textStyle: TextStyle(color: grey900));
    }

    return Text(data, style: textStyle.copyWith(color: color));
  }
}
