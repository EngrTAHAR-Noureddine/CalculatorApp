import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';




class UnitConverter extends StatefulWidget {

  String unit;
  UnitConverter({this.unit});

  @override
  _UnitConverterState createState() => _UnitConverterState();
}
class _Converter{
  int index;
  List indexOfConverters =["Length","Area","Temperature","Volume","Mass","Data"];

  _Converter(value){ this.index = indexOfConverters.indexOf(value);}

  List Units =[
  ["Mile", "Nautical mile", "Kilometre","metre","decemetre","centimetre","milimetre"],
    ["Mile", "Nautical mile", "Kilometre","metre","decemetre","centimetre","milimetre"],
        ];
  List UnitLogo = [
    ["mi","NM","Km","m","dm","cm","mm"],
            ];
  List _lengthPerMetre = [1609.344 , 1852,1000,1,0.1, 0.01 ,0.001];

  num lengthConverter(fromUnit,toUnit, Value){
    int indexFromUnit = Units[index].indexOf(fromUnit);
    int indexToUnit = Units[index].indexOf(toUnit);
    return  num.parse(Value)*(_lengthPerMetre[indexFromUnit]/_lengthPerMetre[indexToUnit]);

  }
}

class _UnitConverterState extends State<UnitConverter> {



  String _unit ;
@override
  void initState() {
    _unit =  widget.unit;
  }
  String fromUnit = "";
  String toUnit = "";
  TextEditingController Value = new TextEditingController();
    
    num result = 0;
  int indexFromUnit = 0;
  int indexToUnit = 0;

  //void select
  Widget _pageUnitConverter(unit){
    _Converter Converter =  new _Converter(unit);
    fromUnit = Converter.Units[Converter.index][indexFromUnit];
    toUnit = Converter.Units[Converter.index][indexToUnit];
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(20),
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text(unit+" : " , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Colors.black, ),)),
            SizedBox(
              height: 10,
            ),
          PopupMenuButton<int>(

            itemBuilder: (context) {
              var list = List<PopupMenuEntry<int>>();

              List ItemUnit = Converter.Units[Converter.index];
              ItemUnit.forEach((element) {

                list.add(
                  PopupMenuItem(
                    child: Text(element),
                    value: ItemUnit.indexOf(element),
                  ),
                );

              });

              return list;
            },
           // initialValue: indexFromUnit,
            onCanceled: () {
              print("You have canceled the menu.");
            },
            onSelected: (value) {
              setState(() {
                indexFromUnit = value;
                fromUnit = Converter.Units[Converter.index][indexFromUnit];

              });

            },

            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: ShapeDecoration(
                color: Colors.white54,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: ListTile(
                trailing: Icon(Icons.keyboard_arrow_down_rounded , color: Colors.blue,),
                title: Text(fromUnit , style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal , color: Colors.black, )),

              ),
            ),
          ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListTile(
                trailing: Text(Converter.UnitLogo[Converter.index][indexFromUnit]),
            contentPadding: EdgeInsets.zero,
            title: TextField(
                textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, ),
              maxLines: 1,
              showCursor: true,
              controller: Value,
              autofocus: true,
              minLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: false,
               // suffix :
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),

                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),

              ),
              toolbarOptions: ToolbarOptions(
                cut: true,
                copy: true,
                selectAll: true,
                paste: true,
              ),
                onSubmitted: (String str){


                  setState((){
                    result = Converter.lengthConverter(fromUnit, toUnit, Value.text);
                  });
                  print(result.toString() is String);
                }
            ),
          ),

        ),
          SizedBox(height: 10,),
          PopupMenuButton<int>(

            itemBuilder: (context) {
              var list = List<PopupMenuEntry<int>>();

              List ItemUnit = Converter.Units[Converter.index];
              ItemUnit.forEach((element) {

                list.add(
                  PopupMenuItem(
                    child: Text(element),
                    value: ItemUnit.indexOf(element),
                  ),
                );

              });

              return list;
            },
            initialValue: indexToUnit,
            onCanceled: () {
              print("You have canceled the menu.");
            },
            onSelected: (value) {
              setState(() {
                toUnit = Converter.Units[Converter.index][value];
                indexToUnit = value;
              });

            },

            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: ShapeDecoration(
                color: Colors.green,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: ListTile(
                trailing: Icon(Icons.keyboard_arrow_down_outlined , color: Colors.blue,),
                title: Text(toUnit , style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal , color: Colors.black, )),

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),

            decoration: ShapeDecoration(
              color: Colors.white,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            child: ListTile(
              trailing: Text(Converter.UnitLogo[Converter.index][indexToUnit]),
              title: Container(
                  alignment: Alignment.centerRight,
                  child: Text(result.toString() , style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal , color: Colors.black, ))),
                
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    initState();


    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: Container(
        color: Colors.orange,
        child: _pageUnitConverter(_unit),
      ),
    );
  }
}
