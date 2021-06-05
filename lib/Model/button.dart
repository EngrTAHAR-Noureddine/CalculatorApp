import 'package:calculatorflutter/Model/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

 class Button extends StatefulWidget{
  List rowButtonsNumbers=[
[ //Row1
    [ Text("C" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "init"],
    [ Icon(Icons.arrow_back , color: Color(0xFFFFFFFF),)  ,Color(0xFFFC8210) , "remove"],
    [ Text("%" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "/100"],
    [ Text("/" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "/"],
],
[ //Row2
        [Text("7" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "7"],
        [Text("8" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "8"],
        [Text("9" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "9"],
        [Text("X" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "*"],

],
[ //Row3
      [Text("4" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "4"],
      [Text("5" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "5"],
      [Text("6" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "6"],
      [Text("-",style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) ,"-"],

],
[ //Row4
        [Text("1",style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) , "1"],
        [Text("2" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "2" ],
        [Text("3" ,style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) ,"3" ],
        [Text("+" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) ,"+" ],

],
[ //Row5
      [Text("+/-" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "*(-1)"],
      [Text("0" ,style: TextStyle(color:  Color(0xFF707070))) ,Color(0xFFF4F4F4) , "0"],
      [Text("." ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "."],
      [Text("=",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFFFC8210) , "="],
]
  ];
  List rowButtonsFunctions = [
  [//Row1

  [Text("X\u207B\u00B9", style: TextStyle(color: Color(0xFFFFFFFF) ,))  ,Color(0xFF363636) , "^(-1)"],
  [ Text("!", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "!"],
  [Icon(MyFlutterApp.square_root_alt,size: 16 ,color: Color(0xFFFFFFFF) ,) ,Color(0xFF363636) ,String.fromCharCode(0x221A)+"("],
  [Icon(MyFlutterApp.pi ,size: 18 ,color: Color(0xFFFFFFFF) ,) ,Color(0xFF363636) ,String.fromCharCode(0x03C0)]

  ],
    [//Row2

      [Text("(" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "("],
      [Text(")",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,")"],
      [Text("x²" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "^(2)"],
      [Text("x\u02b8" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"^("],


    ],
    [//Row3

      [Text("10\u02b8" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "*10^("],
      [Text("Log\u2081\u2080" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) ,"log("],
      [ Text("ln",  style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "ln("],
      [ Text("e\u02e3", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) ,"e^"],

    ],
    [//Row4

      [Text("sin" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "sin("],
      [Text("cos",style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "cos("],
      [Text("tan" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"tan("],
      [Text("ln2",style: TextStyle(color:Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "ln2"],

    ],
    [//Row5

      [Text("acos" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "acos("],
      [Text("asin",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"asin("],
      [Text("atan" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) ,"atan("],
      [Text("|x|" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"abs("]

    ]

  ];

  String rndToDeg = "Deg";
  static final Button _singleton = Button._internal();

  factory Button() {
    return _singleton;
  }

  Button._internal();

  @override
  State<StatefulWidget> createState() {

    throw UnimplementedError();
  }
}