import 'dart:ffi';

import 'package:calculatorflutter/Model/database/database.dart';
import 'package:calculatorflutter/Model/history_model.dart';
import 'package:flutter/material.dart';

class HistoryBody extends StatefulWidget {

  deleteData()=>_HistoryBodyState()._deleteData();

  @override
  _HistoryBodyState createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {

  Future<void> _deleteData() async {

    await DBProvider.db.deleteAll();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<History>>(
      future: DBProvider.db.getAllHistories(),
      builder: (BuildContext context, AsyncSnapshot<List<History>> snapshot) {

        if (snapshot.hasData) {
          if(snapshot.data.isEmpty){
            return Center(child: Text("no history" ,style: TextStyle(color: Theme.of(context).primaryColorDark),),);
          }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                History item = snapshot.data[index];
                return ListTile(
                  title: Text(item.operandExpression, style: TextStyle(color: Theme.of(context).primaryColorDark)),

                  subtitle:  Text("= "+item.result,style: TextStyle(color: Theme.of(context).primaryColor)),
                );
              },
            );}
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
