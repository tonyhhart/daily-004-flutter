import 'package:flutter/material.dart';
import 'package:daily_004_flutter/theme/text_styles.dart';

class DisplayText extends StatelessWidget {
  const DisplayText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: UrbanistText(
              text,
              variant: UrbanistTextVariants.h3,
            ),
          ),
        ],
      ),
    );
  }
}
