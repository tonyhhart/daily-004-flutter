import 'package:daily_004_flutter/theme/colors.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.paddingBottom});

  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width / 5;
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height,
                        child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFf8e3ff),
                            Color(0xFFeae1fd),
                          ],
                        ))),
                      ),
                      SizedBox(
                        height: height * 4 + paddingBottom,
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFfeedff),
                              Color(0xFFe0eeff),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: height * 5 + paddingBottom,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFf8d462),
                          Color(0xFFfb9d65),
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: height * 5,
          child: Container(
              decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: border, width: 0.5)),
          )),
        )
      ],
    );
  }
}
