import 'package:flutter/widgets.dart';
import 'package:daily_004_flutter/screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => const HomeScreen(),
};
