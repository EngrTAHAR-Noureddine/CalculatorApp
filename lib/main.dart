import 'package:calculatorflutter/View/history.dart';
import 'package:calculatorflutter/View/unit_converter.dart';
import 'package:flutter/material.dart';

import 'View/Calculator.dart';

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
        primarySwatch: Colors.red,
        primaryColor: Colors.black ,

        backgroundColor: Colors.black ,

        indicatorColor: Color(0xff0E1D36) ,
        buttonColor: Color(0xff3B3B3B) ,

        hintColor: Color(0xff280C0B) ,
        highlightColor: Color(0xff372901) ,
        hoverColor:  Color(0xff3A3A3B),

        focusColor: Color(0xff0B2512),
        disabledColor: Colors.grey,

        cardColor:  Color(0xFF151515) ,
        canvasColor: Colors.black ,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.blue),
        ),
        bottomAppBarColor: Colors.black,
        cardTheme: CardTheme(
            color: Colors.black
        ),
        popupMenuTheme: PopupMenuThemeData(color: Colors.black),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
        tabBarTheme: TabBarTheme(labelColor: Colors.black,unselectedLabelColor: Colors.black),

        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:  ColorScheme.dark() ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),

        ),
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
          title: 'nCalculator',
          home:Home(),
      routes: {
        '/history' : (context)=>HistoryWidget(),
        '/unitconverter' : (context)=>UnitConverter(),
      },
                    );

  }
}