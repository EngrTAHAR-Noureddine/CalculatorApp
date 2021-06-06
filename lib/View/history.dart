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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color, //change your color here
        ),
        title: Text("History", style: TextStyle(color : Theme.of(context).primaryColorDark),),
        backgroundColor:Theme.of(context).appBarTheme.color ,
      ),
      body: HistoryBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        child: Icon(Icons.delete ,  color: Theme.of(context).primaryColorDark,),
        onPressed:(){
          HistoryBody().deleteData();
          setState(() {});
        }


    ),

    );
  }
}
