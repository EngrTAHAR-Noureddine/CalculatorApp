import 'package:calculatorflutter/Model/database/database.dart';
import 'package:calculatorflutter/Model/history_model.dart';
import 'package:calculatorflutter/View_Model/history.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {


  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF707070), //change your color here
        ),
        title: Text("History", style: TextStyle(color : Color(0xFF707070)),),
        backgroundColor:Colors.white ,
      ),
      body: HistoryBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF707070),
        child: Icon(Icons.delete),
        onPressed:(){
          HistoryBody().deleteData();
          setState(() {});
        }


    ),

    );
  }
}
