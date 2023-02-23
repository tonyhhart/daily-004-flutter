import 'package:daily_004_flutter/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:daily_004_flutter/theme/text_styles.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.text,
    required this.active,
    required this.onPressed,
  });

  final dynamic text;
  final bool active;
  final Function(dynamic text) onPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4;
    double height = MediaQuery.of(context).size.width / 5;
    var t = text is double ? text.round().toString() : text.toString();
    var color = ["÷", "×", '-', "+", '='].contains(text) ? white : grey900;
    return Expanded(
      flex: text != 0 ? 1 : 2,
      child: SizedBox(
        height: height,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: active ? offWhite : null,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            side: BorderSide(width: 0.5, color: border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                child: Center(
                  child: UrbanistText(
                    t,
                    variant: UrbanistTextVariants.h4,
                    color: color,
                  ),
                ),
              )
            ],
          ),
          onPressed: () {
            onPressed(text);
          },
        ),
      ),
    );
  }
}
