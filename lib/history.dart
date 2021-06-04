import 'package:calculatorflutter/database.dart';
import 'package:calculatorflutter/history_model.dart';
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
        backgroundColor:Colors.white ,),
      body: FutureBuilder<List<History>>(
        future: DBProvider.db.getAllHistories(),
        builder: (BuildContext context, AsyncSnapshot<List<History>> snapshot) {
          print("----------------------------");
          print(snapshot.hasData);
          print(snapshot.data);
          print(snapshot.hasError);
          print(snapshot.error);
          print("----------------------------");
          if (snapshot.hasData) {
            if(snapshot.data.isEmpty){
              return Center(child: Text("no history"),);
            }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                History item = snapshot.data[index];
                return ListTile(
                  title: Text(item.operandExpression),

                  subtitle:  Text("= "+item.result),
                );
              },
            );}
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF707070),
        child: Icon(Icons.delete),
        onPressed: () async {

          await DBProvider.db.deleteAll();
          setState(() {});
        },
      ),
    );
  }
}
