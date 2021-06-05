import 'package:flutter/material.dart';

import '../View_Model/Calculator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality( textDirection: TextDirection.ltr, /* rtl : dir kolech right to left ; ltr : left to right ; */
        child: Scaffold(
          backgroundColor: Colors.white,


          body: HomeWidgets(),



        ),
    );
  }
}
