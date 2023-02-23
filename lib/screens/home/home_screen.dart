import 'package:flutter/material.dart';
import 'package:daily_004_flutter/screens/home/components/calculator_button.dart';
import 'package:daily_004_flutter/screens/home/components/display_text.dart';
import 'package:daily_004_flutter/screens/home/components/background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> commands = [0.0];

  getDisplayText() {
    var result =
        isNumeric(commands.last) ? (commands.last) : getResult(commands, false);

    if (result is String) {
      return result.replaceAll(".", ",");
    }

    if (result % 1 != 0) {
      return num.parse(result.toStringAsPrecision(10))
          .toString()
          .replaceAll(".", ",");
    }

    if (result == -0.0 && result.isNegative) {
      return "-0";
    }

    if (result is double) {
      return result.round().toString();
    }

    return result.toString();
  }

  onPressed(dynamic text) {
    setState(() {
      if (commands.first == "=" && isNumeric(text)) {
        commands = [0.0];
      }

      if (commands.first == "=" && !isNumeric(text)) {
        commands = [commands.last];
      }

      if (text == 'C') {
        commands.last = 0.0;
      } else if (text == 'AC') {
        commands = [0.0];
      } else if (text == '+/-' && isNumeric(commands.last)) {
        if (commands.last is String) {
          commands.last = commands.last.contains("-")
              ? commands.last.replaceAll("-", "")
              : "-${commands.last}";
        } else {
          commands.last *= -1;
        }
      } else if (text == '+/-' && !isNumeric(commands.last)) {
        commands.add(-0);
      } else if (text == '%' &&
          commands.length > 2 &&
          ["+", "-"].contains(commands[commands.length - 2]) &&
          isNumeric(commands.last)) {
        var result = getResult(commands, false);
        commands.last = result * toNum(commands.last) / 100;
      } else if (text == '%' && ["+", "-"].contains(commands.last)) {
        var num = toNum(commands[commands.length - 2]);
        var result = getResult(commands, true);
        commands.add(result * num / 100);
      } else if (text == '%' && ["÷", "×"].contains(commands.last)) {
        var result = getResult(commands, false);
        commands.add(result / 100);
      } else if (text == '%' && isNumeric(commands.last)) {
        commands.last = commands.last / 100;
      } else if (text == "=") {
        var result = getResult(commands, true);
        commands = ["=", result];
      } else if (text == ",") {
        if (commands.last is int) {
          commands.last = "${commands.last},";
        }
      } else if (isNumeric(text) &&
          commands.last is String &&
          isNumeric(commands.last)) {
        var number = commands.last + text.toString();
        if (number.length < 10) {
          commands.last = number;
        }
      } else if (isNumeric(text) && isNumeric(commands.last)) {
        var number = commands.last.round().toString() + text.round().toString();
        if (number.length < 10) {
          var convertNegative =
              commands.last == 0 && commands.last.isNegative ? -1 : 1;
          var result = num.parse(number) * (convertNegative);
          commands.last = result;
        }
      } else if (!isNumeric(text) && !isNumeric(commands.last)) {
        commands.last = text;
      } else {
        commands.add(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var active = commands.where((e) => ["÷", "×", "-", "+"].contains(e));
    var paddingBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DisplayText(text: getDisplayText()),
            CalculatorButtonsContainer(paddingBottom: paddingBottom, children: [
              for (var row in buttons)
                Row(
                  children: [
                    for (var text in row)
                      CalculatorButton(
                        text: getButtonLabel(text, getDisplayText()),
                        active: active.isNotEmpty && active.last == text,
                        onPressed: onPressed,
                      ),
                  ],
                ),
            ]),
          ],
        ),
      ),
    );
  }
}

class CalculatorButtonsContainer extends StatelessWidget {
  const CalculatorButtonsContainer({
    super.key,
    required this.paddingBottom,
    required this.children,
  });

  final double paddingBottom;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, paddingBottom),
      child: Stack(
        children: [
          Background(paddingBottom: paddingBottom),
          Column(
            children: children,
          )
        ],
      ),
    );
  }
}

getButtonLabel(dynamic text, String current) {
  return text == 'AC'
      ? current != "0"
          ? "C"
          : "AC"
      : text;
}

num getResult(List<dynamic> commands, bool full) {
  var result = commands[0];
  if (commands.length == 2) {}
  if (commands.length >= 3) {
    for (var i = 2; i < commands.length - (full ? 0 : 1); i += 2) {
      result =
          performCalculation([result, commands[i - 1], toNum(commands[i])]);
    }
  }

  return toNum(result);
}

num performCalculation(List<dynamic> item) {
  switch (item[1]) {
    case "+":
      return toNum(item[0]) + toNum(item[2]);
    case "-":
      return toNum(item[0]) - toNum(item[2]);
    case "×":
      return toNum(item[0]) * toNum(item[2]);
    case "÷":
      return toNum(item[0]) / toNum(item[2]);
  }
  return item[0];
}

isNumeric(dynamic item) {
  return (item is num ||
          (item is String && item.contains(",") && item.length > 1)) &&
      !["%", "÷", "×", "-", "+"].contains(item);
}

toNum(dynamic item) {
  try {
    if (item is String && item.contains(",") && item.length > 1) {
      return double.parse(item.replaceAll(",", '.'));
    }
  } catch (ex) {
    //
  }
  return item;
}

const buttons = [
  ["AC", "+/-", "%", "÷"],
  [7, 8, 9, "×"],
  [4, 5, 6, "-"],
  [1, 2, 3, "+"],
  [0, ",", "="]
];
