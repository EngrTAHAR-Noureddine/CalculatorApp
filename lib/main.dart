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

        indicatorColor: Color(0xff0E1D36) ,

        accentColor: Colors.blue,
        buttonColor: Colors.white ,


        //accentColor: Colors.black,

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

        /* buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:  ColorScheme.dark() ),  */
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
        //  iconTheme: IconThemeData(color: Colors.white),

        ),


      ),
      darkTheme: ThemeData( /*Dark */
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.dark,

        primarySwatch: Colors.red,
        primaryColor: Color(0xFF707070) ,
        primaryColorDark: Colors.white,//Color(0xFF363636),
        primaryColorLight: Colors.white,
        backgroundColor: Colors.black ,

        indicatorColor: Colors.white,//Color(0xff0E1D36) ,
        accentColor: Colors.white,

        buttonColor: Colors.black ,


        //accentColor: Colors.black,

        iconTheme: IconThemeData(color: Color(0xFF707070) ,),
        primaryIconTheme: IconThemeData(color: Color(0xFF707070)),


        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.black,),


       /* hintColor: Color(0xff280C0B) ,
        highlightColor: Color(0xff372901) ,
        hoverColor:  Color(0xff3A3A3B),
*/
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

        /* buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:  ColorScheme.dark() ),  */
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.black,
          //  iconTheme: IconThemeData(color: Colors.white),

        ),
/* //TODO
* icon of history in light mode is note light
* and remove char in expression raho yremovi men tali
* 12345 ki ji tremovi 3 yremovi 5
*
*
* */

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