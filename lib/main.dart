import 'package:calculatorflutter/View/history.dart';
import 'package:calculatorflutter/View/unit_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View/Calculator.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData( /*Light */
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,

        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF707070) ,
        primaryColorDark: Color(0xFF363636),
        primaryColorLight: Colors.white,
        backgroundColor: Colors.white ,
         dividerColor: Colors.blue,
        indicatorColor: Color(0xff0E1D36) ,

        accentColor: Colors.blue,
        buttonColor: Colors.white ,


        iconTheme: IconThemeData(color: Color(0xFF707070) ,),
        primaryIconTheme: IconThemeData(color: Color(0xFF707070)),


        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xFF707070)),


        hintColor: Color(0xff280C0B) ,
        highlightColor: Color(0xff372901) ,
        hoverColor:  Color(0xff3A3A3B),

        focusColor: Color(0xff0B2512),
        disabledColor: Colors.grey,

        cardColor:  Colors.white ,



        cardTheme: CardTheme(
          color: Colors.white,
        ),
        popupMenuTheme: PopupMenuThemeData(color: Colors.white),


        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),

        scaffoldBackgroundColor: Colors.white,

        tabBarTheme: TabBarTheme(labelColor: Color(0xFF707070),unselectedLabelColor: Colors.black ,
             ),

        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,

        ),


      ),
      darkTheme: ThemeData( /*Dark */
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.dark,

        primarySwatch: Colors.red,
        primaryColor: Color(0xFF707070) ,
        primaryColorDark: Colors.white,//Color(0xFF363636),
        primaryColorLight: Colors.white,
        backgroundColor: Color(0xFF121212) ,
        dividerColor:Color(0xFF121212),
        indicatorColor: Colors.white,//Color(0xff0E1D36) ,
        accentColor: Colors.white,

        buttonColor: Color(0xFF121212) ,

        iconTheme: IconThemeData(color: Color(0xFF707070) ,),
        primaryIconTheme: IconThemeData(color: Color(0xFF707070)),


        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xFF121212),),

        focusColor: Colors.white,
        disabledColor: Colors.grey,

        cardColor:  Colors.white12 ,



        cardTheme: CardTheme(
          color: Colors.white,
        ),
        popupMenuTheme: PopupMenuThemeData(color: Color(0xFF707070)),


        bottomSheetTheme: BottomSheetThemeData(
            modalBackgroundColor: Color(0xFF222222),
        //    backgroundColor: Color(0xFF222222)
        ),

        scaffoldBackgroundColor: Color(0xFF222222),

        tabBarTheme: TabBarTheme(
          labelColor: Color(0xFF707070), //#222222
          unselectedLabelColor: Colors.white38 ,

        ),

        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor:Color(0xFF121212),
          //  iconTheme: IconThemeData(color: Colors.white),

        ),


      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
          title: 'Calculator',
          home:Calculator(),
      routes: {
        '/history' : (context)=>HistoryWidget(),
        '/unitconverter' : (context)=>UnitConverter(),
      },
                    );

  }
}