import 'package:flutter/material.dart';

class ColorStyle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    throw UnimplementedError();
  }

  static final ColorStyle _singleton = ColorStyle._internal();

  factory ColorStyle() {
    return _singleton;
  }

  ColorStyle._internal();



  var boxExpColor = Colors.white;
  var textExpColor = Colors.black;
  var boxResultColor = Colors.white;
  var borderBoxResult = Colors.black;
  var textResultColor =  Color(0xFF707070);
  var iconHistoryColor = Color(0xFF707070);
  var boxIconHistoryColor = Colors.white;
  var iconConverterColor = Color(0xFF707070);
  var boxIconConverterColor= Colors.white;
  var textDegColor = Colors.white;
  var boxDegColor = Color(0xFF363636);
  var textLogColor = Color(0xFFFFFFFF);
  var boxLogColor = Color(0xFF363636);
  var textNumColor = Color(0xFF707070);
  var boxNumberColor = Color(0xFFF4F4F4);
var textUnitTitleColor = Colors.black;
var boxBoxOFUnits = Color(0xFFF4F4F4);
var colorOfCardUnit = Colors.white;
var TextOfCardUnit = Color(0xFF707070);



  

}