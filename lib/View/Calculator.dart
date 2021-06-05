import 'package:flutter/material.dart';

import '../View_Model/Calculator.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Directionality( textDirection: TextDirection.ltr, /* rtl : dir kolech right to left ; ltr : left to right ; */
        child: Scaffold(
          backgroundColor: Colors.white,


          body: CalculatorWidgets(),



        ),
    );
  }
}
