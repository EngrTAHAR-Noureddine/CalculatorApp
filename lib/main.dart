import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {




    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
          title: 'nCalculator',
          home:Home(),
                    );

  }
}