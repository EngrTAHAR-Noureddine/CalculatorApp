import 'package:calculatorflutter/Model/unit_converter_model.dart';
import 'package:flutter/material.dart';


class UnitConverterView extends StatefulWidget {

  String unit;
  UnitConverterView({this.unit});
  @override
  _UnitConverterViewState createState() => _UnitConverterViewState();
}

class _UnitConverterViewState extends State<UnitConverterView> {
  String _unit ;

  String fromUnit = "";
  String toUnit = "";
  TextEditingController Value = new TextEditingController();

  num result = 0;
  int indexFromUnit = 0;
  int indexToUnit = 0;


  @override
  void initState() {
    _unit =  widget.unit;
  }
  Widget _pageUnitConverter(unit){
    UnitConverter().index = UnitConverter().indexOfConverters.indexOf(unit);
    fromUnit = UnitConverter().Units[UnitConverter().index][indexFromUnit];
    toUnit = UnitConverter().Units[UnitConverter().index][indexToUnit];

    return Container(
        color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(20),
      alignment: Alignment.topCenter,
      child: ListView(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text(unit+" : " , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Theme.of(context).primaryColorDark, ),)),
          SizedBox(
            height: 10,
          ),
          PopupMenuButton<int>(

            itemBuilder: (context) {
              var list = List<PopupMenuEntry<int>>();

              List ItemUnit = UnitConverter().Units[UnitConverter().index];
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
                fromUnit = UnitConverter().Units[UnitConverter().index][indexFromUnit];
                result = UnitConverter().lengthConverter(fromUnit, toUnit, (Value.text.isEmpty)?"0":Value.text);

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
              trailing: Text(UnitConverter().UnitLogo[UnitConverter().index][indexFromUnit] , style: TextStyle(color: Theme.of(context).primaryColor),),
              contentPadding: EdgeInsets.zero,
              title: TextField(
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColorDark ),
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
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    hintText: "0",
                    hintStyle: TextStyle(color: Colors.grey),

                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
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
                      result = UnitConverter().lengthConverter(fromUnit, toUnit, (Value.text.isEmpty)?"0":Value.text);
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

              List ItemUnit = UnitConverter().Units[UnitConverter().index];
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
                toUnit = UnitConverter().Units[UnitConverter().index][value];
                indexToUnit = value;

                result = UnitConverter().lengthConverter(fromUnit, toUnit, (Value.text.isEmpty)?"0":Value.text);
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
              color: Theme.of(context).backgroundColor,


              shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).accentColor, width: 1,),
                borderRadius: BorderRadius.circular(10),

              ),
            ),
            child: ListTile(

              trailing: Text(UnitConverter().UnitLogo[UnitConverter().index][indexToUnit] , style: TextStyle(color: Theme.of(context).primaryColor),),
              title: Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                      softWrap: true,
                      text: TextSpan(text:  result.toString() , style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal , color: Theme.of(context).primaryColorDark, )))),

            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white ,
      child: _pageUnitConverter(_unit),
    );
  }
}
