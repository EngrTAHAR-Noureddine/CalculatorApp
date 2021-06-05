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
  List indexOfConverters =["Length","Area","Volume","Mass","Data","Temperature"];

  _Converter(value){ this.index = indexOfConverters.indexOf(value);}

  List Units =[
  ["Mile", "Nautical mile", "Kilometre","metre","decemetre","centimetre","milimetre"],
    ["Acre", "Hectare", "Are","Square metre","Square foot","Square inch","Square centimentre"],
    ["Gallon(US)","Gallon(UK)","Cubic metre", "Cubic foot", "Litre","Cubic inch", "Cubic centimetre","Millilitre"],
    ["Ton(UK)","Ton","Ton(US)","Kilogram","Pound","Ounce","Gram"],
    ["Terabyte","Gigabyte","Megabyte","Kilobyte","Byte","Bit"],
    ["Celsius","Kelvin","Fahrenheit"]
        ];
  List UnitLogo = [
    ["mi","NM","Km","m","dm","cm","mm"],
    ["ac","ha","a","m²","ft²","in²","cm²"],
    ["Gal(US)","Gal(UK)","m\u00B3", "ft\u00B3", "L","in\u00B3", "cm\u00B3","mL"],
    ["t(UK)","t","t(US)","Kg","lb","Oz","g"],
    ["TB","GB","MB","KB","B","bit"],
    ["°C","°K","°F"]
            ];
  List _ValuesPerMetre = [
    [1609.344 , 1852,1000,1,0.1, 0.01 ,0.001],
    [4046.8564224 , 10000 ,100 ,1, 0.09290304  , 0.00064516 ,0.0001],
    [3.785411784, 4.54609 , 1000 , 28.316846592, 1 ,0.016387064, 0.001,0.001],
    [1016.0469088,1000,907.18474,1,0.45359237,0.0283495231,0.001],
    [1099511627776,1073741824,1048576,1024,1,0.125],

  ];


  num lengthConverter(fromUnit,toUnit, Value){
    int indexFromUnit = Units[index].indexOf(fromUnit);
    int indexToUnit = Units[index].indexOf(toUnit);
    if(index == 5){
      if(fromUnit == toUnit){return num.parse(Value);}
      else {
        switch(fromUnit){
          case "Celsius":
                  switch(toUnit){
                    case "Kelvin":
                      return (num.parse(Value) + 273);
                                    break;
                    default : /* "Fahrenheit" */
                            return (((num.parse(Value) *9)/5) + 32);
                      break;
                  }
                          break;
          case "Kelvin" :
                        switch(toUnit){
                                  case "Celsius": return num.parse(Value) - 273;
                                                break;
                                  default : /* "Fahrenheit" */
                                            return (  ((num.parse(Value) - 273)*9/5) + 32) ;
                                    break;
                                }

                        break;
          default : /* "Fahrenheit" */
            switch(toUnit){
                      case "Celsius": return (num.parse(Value) - 32)*5/9;
                                break;
                      default : /* "Kalvin" */
                            return (((num.parse(Value) - 32)*5/9) + 273) ;
                        break;
                         }
                break;
        }
      }

    }else {
      return num.parse(Value) * (_ValuesPerMetre[index][indexFromUnit] /
          _ValuesPerMetre[index][indexToUnit]);
    }

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
                result = Converter.lengthConverter(fromUnit, toUnit, (Value.text.isEmpty)?"0":Value.text);

              });

            },

            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: ShapeDecoration(
                color: Color(0xFFF4F4F4),

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: ListTile(
                trailing: Icon(Icons.keyboard_arrow_down_rounded , color: Color(0xFF363636),),
                title: RichText(
                    softWrap: true,
                    text: TextSpan(text: fromUnit , style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal , color: Color(0xFF363636), ))),

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
                    result = Converter.lengthConverter(fromUnit, toUnit, (Value.text.isEmpty)?"0":Value.text);
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

                result = Converter.lengthConverter(fromUnit, toUnit, (Value.text.isEmpty)?"0":Value.text);
              });

            },

            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: ShapeDecoration(
                color: Color(0xFFF4F4F4),

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: ListTile(
                trailing: Icon(Icons.keyboard_arrow_down_outlined , color: Color(0xFF363636),),
                title: RichText(
                  softWrap: true,
                  text: TextSpan(text: toUnit , style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal , color: Color(0xFF363636), ))),

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),

            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F4),


              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1,),
                  borderRadius: BorderRadius.circular(10),

              ),
            ),
            child: ListTile(

              trailing: Text(Converter.UnitLogo[Converter.index][indexToUnit] , style: TextStyle(color: Color(0xFF363636)),),
              title: Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(text:  result.toString() , style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal , color: Color(0xFF363636), )))),

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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFF707070), //change your color here
        ),
        title: Text("Unit Converter", style: TextStyle(color : Color(0xFF707070)),),
        backgroundColor:Colors.white ,),
      body: Container(
        color:Colors.white ,
        child: _pageUnitConverter(_unit),
      ),
    );
  }
}
