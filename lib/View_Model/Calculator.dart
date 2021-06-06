import 'package:calculatorflutter/Model/button.dart';
import 'package:calculatorflutter/Model/database/database.dart';
import 'package:calculatorflutter/Model/history_model.dart';
import 'package:calculatorflutter/View/unit_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:calculatorflutter/Model/read_exp_functions/function_tree.dart';
import '../Model/my_flutter_app_icons.dart';

import 'package:flutter/services.dart';


class CalculatorWidgets extends StatefulWidget {
  @override
  _CalculatorWidgetsState createState() => _CalculatorWidgetsState();
}

class _CalculatorWidgetsState extends State<CalculatorWidgets> {
  num Result = 0.0;
   _onPressedButton(String _outputChar){
    TextSelection offsetSelection = f.selection;
    List specialChar = ["ln(", "og(", "in(", "os(", "an(", "bs(", "sh(","nh("];

    switch(_outputChar){
      case "init" : setState(() {
        Result = 0.0;
          isShowCursor = true;

                      f.text="";
                    f.selection = TextSelection(baseOffset: 0 , extentOffset: 0);});
                    break;
      case "remove":  String temp;
                      setState(() {
                        Result = 0.0;
                        isShowCursor = true;
                        if (f.text.isNotEmpty) {
                          if (f.text.length > 2) {
                            temp = specialChar.firstWhere((element) =>
                            element == f.text.substring(f.text.length - 3, f.text.length),
                                orElse: () {
                                  return null;
                                }).toString();
                          } else
                            temp = "null";
                          if (temp != "null") {
                            if ([6, 7].contains(specialChar.indexOf(temp))) {
                              f.text = f.text.substring(0, (f.text.length - 5));
                              f.selection = TextSelection(
                                  baseOffset: offsetSelection.baseOffset - 5,
                                  extentOffset: offsetSelection.baseOffset - 5);
                            } else if(specialChar.indexOf(temp) == 0){
                              f.text = f.text.substring(0, (f.text.length - 3));
                              f.selection = TextSelection(
                                  baseOffset: offsetSelection.baseOffset - 3,
                                  extentOffset: offsetSelection.baseOffset - 3);
                            }
                            else{
                              f.text = f.text.substring(0, (f.text.length - 4));
                              f.selection = TextSelection(
                                  baseOffset: offsetSelection.baseOffset - 4,
                                  extentOffset: offsetSelection.baseOffset - 4);
                            }
                          } else {
                            f.text = f.text.substring(0, (f.text.length - 1));
                            f.selection = TextSelection(
                                baseOffset: offsetSelection.baseOffset - 1,
                                extentOffset: offsetSelection.baseOffset - 1);
                          }
                        } else {
                          f.text = "";
                          f.selection = TextSelection(baseOffset: 0, extentOffset: 0);
                        }
                      });
                                  break;
      case "=": String tempText;

                 tempText  =f.text;
                setState(() {

                  if(Button().rndToDeg == "Deg"){
                    tempText = tempText.replaceAll("cos(","cosD(");
                    tempText = tempText.replaceAll("cosR(","cosD(");
                    tempText = tempText.replaceAll("sin(","sinD(");
                    tempText = tempText.replaceAll("sinR(","sinD(");
                    tempText = tempText.replaceAll("tan(","tanD(");
                    tempText = tempText.replaceAll("tanR(","tanD(");

                    tempText = tempText.replaceAll("acos(","acosD(");
                    tempText = tempText.replaceAll("acosR(","acosD(");
                    tempText = tempText.replaceAll("asin(","asinD(");
                    tempText = tempText.replaceAll("asinR(","asinD(");
                    tempText = tempText.replaceAll("atan(","atanD(");
                    tempText = tempText.replaceAll("atanR(","atanD(");


                  }else{
                    tempText = tempText.replaceAll("cos(","cosR(");
                    tempText = tempText.replaceAll("cosD(","cosR(");
                    tempText = tempText.replaceAll("sin(","sinR(");
                    tempText = tempText.replaceAll("sinD(","sinR(");
                    tempText = tempText.replaceAll("tan(","tanR(");
                    tempText = tempText.replaceAll("tanD(","tanR(");

                    tempText = tempText.replaceAll("acos(","acosR(");
                    tempText = tempText.replaceAll("acosD(","acosR(");
                    tempText = tempText.replaceAll("asin(","asinR(");
                    tempText = tempText.replaceAll("asinD(","asinR(");
                    tempText = tempText.replaceAll("atan(","atanR(");
                    tempText = tempText.replaceAll("atanD(","atanR(");
                  }
                  print(tempText);
                  try {
                    Result = (tempText.isNotEmpty) ? tempText.interpret() : 0;
                  }catch(e){Result = null; print(e);}

                  if((tempText.isNotEmpty)&&(Result!=null)) {
                    History newHistory = new History(operandExpression: tempText,result: Result.toString());
                    DBProvider.db.newHistory(newHistory);
                  }
                  isShowCursor = false;
                });
        break;
      default :
        if(isShowCursor) {
          setState(() {
            Result = 0;
            if (f.text.isNotEmpty) {
              f.text =
                  f.text.substring(0, offsetSelection.baseOffset) +
                      _outputChar +
                      f.text.substring(
                          offsetSelection.baseOffset, f.text.length);
            } else {
              f.text = _outputChar;
            }

            f.selection = TextSelection(
                baseOffset: (offsetSelection.baseOffset + _outputChar.length),
                extentOffset: (offsetSelection.extentOffset +
                    _outputChar.length));
          });
        }
        break;




    }



  }


  Widget _button(_child ,_colorBox, _tapping){

    return Expanded(
      child: Card(
      //  color:
        color: Colors.green,
        elevation: 0,
        margin: EdgeInsets.all(5),
        child: MaterialButton(
          padding: EdgeInsets.all(0),
          height: double.infinity,
          highlightColor: Color(0xFF363636),
          elevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5) ,
                    borderSide: BorderSide(width:0 , color:(_colorBox==Color(0xFFF4F4F4))? Colors.black :(_colorBox==Color(0xFF363636))?Colors.white: Colors.transparent,)),
          color: _colorBox,
          onPressed: ()=> _onPressedButton(_tapping),
          child: _child,
        ),
      ),
    );
  }


  List<Widget> _rowButtons(list){



    return new List<Widget>.generate(list.length, (int index) {

      return _button(list[index][0], list[index][1] ,list[index][2]);
    });

  }


Widget _bigPad(){

  return Container(
    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
    width: MediaQuery.of(context).size.width,
    color: Theme.of(context).backgroundColor,
    alignment: Alignment.center,
    child: Column(
      /* mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
      children: [
        Expanded(

          child: Row(

            children: _rowButtons(Button().rowButtonsFunctions[0]+Button().rowButtonsNumbers[0]),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(Button().rowButtonsFunctions[1]+Button().rowButtonsNumbers[1]),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(Button().rowButtonsFunctions[2]+Button().rowButtonsNumbers[2]),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(Button().rowButtonsFunctions[3]+Button().rowButtonsNumbers[3]),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(Button().rowButtonsFunctions[4]+Button().rowButtonsNumbers[4]),
          ),
        ),
      ],
    ),
  );
}

  Widget _smallPad(){
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title:TabBar(
            indicatorColor: Theme.of(context).indicatorColor,
            unselectedLabelColor:Theme.of(context).tabBarTheme.unselectedLabelColor,
            labelColor: Theme.of(context).tabBarTheme.labelColor,

            tabs: <Widget>[
              Tab(
                text: 'Functions',
              ),
              Tab(text: 'Numbers',),

            ],
          ),
        ),
        body:TabBarView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              width: MediaQuery.of(context).size.width,

              alignment: Alignment.center,
              child: Column(
                /* mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
                children: [
                  Expanded(

                    child: Row(

                      children: _rowButtons(Button().rowButtonsFunctions[0]),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(Button().rowButtonsFunctions[1]),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _rowButtons(Button().rowButtonsFunctions[2]),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(Button().rowButtonsFunctions[3]),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(Button().rowButtonsFunctions[4]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              width: MediaQuery.of(context).size.width,

              alignment: Alignment.center,
              child: Column(

                /* mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
                children: [
                  Expanded(

                    child: Row(

                      children: _rowButtons(Button().rowButtonsNumbers[0]),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(Button().rowButtonsNumbers[1]),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _rowButtons(Button().rowButtonsNumbers[2]),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(Button().rowButtonsNumbers[3]),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(Button().rowButtonsNumbers[4]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

  TextEditingController f = TextEditingController();
  bool isShowCursor = true;
  TextSelection txtselct = new TextSelection(baseOffset: 0, extentOffset: 0);
  Widget _operationWidget(){
    return TextField(

        style: TextStyle(fontSize: 20 , color: Theme.of(context).primaryColorDark),
        showCursor: isShowCursor,
        readOnly: true,
      autofocus: true,
      controller: f,
      expands: true,
      maxLines: null,
      keyboardType: TextInputType.multiline,


      textAlignVertical: TextAlignVertical.bottom,
      onTap: () {
       setState(() {
         isShowCursor = true;
       });
        txtselct = f.selection;
        if(f.text.isNotEmpty){
          if(["a","b","c", "g","h","i", "l","n","o" ,"s","t"].contains(f.text[f.selection.baseOffset - 1])){
             f.selection = TextSelection(
                 baseOffset: (f.text.indexOf("(", f.selection.baseOffset))+1,
                 extentOffset: (f.text.indexOf("(", f.selection.baseOffset))+1);
          }}
         print(f.selection);


      },
     decoration: InputDecoration(
       isDense: false,

       counterStyle: TextStyle(
         height: double.minPositive,
       ),
       counterText: "",
focusedBorder:OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),

  borderSide: BorderSide(
    color: Colors.transparent,
    width: 0,
    style: BorderStyle.solid,
  ),
) ,
border:  OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),

  borderSide: BorderSide(
    color: Colors.transparent,
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
    );
  }

 Widget  _itemsList(){
    // Navigator.of(context).pushNamed('/unitconverter');

     List icons=[
       MyFlutterApp.shapes,
       MyFlutterApp.straighten,
       MyFlutterApp.temperatire,
       MyFlutterApp.cube,
       MyFlutterApp.balance_scale_left,
       MyFlutterApp.data_usage
                ];
     List titles =["Area","Length","Temperature","Volume","Mass","Data"];

return Container(
  color: Colors.transparent,
  alignment: Alignment.centerLeft,
  padding: EdgeInsets.all(0),
  child: MaterialButton(
      height: double.infinity,
      elevation: 0,
      color: Theme.of(context).backgroundColor,
      child: Icon(Icons.straighten_outlined, color: Theme.of(context).primaryColor,),
      onPressed: (){
        return showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            builder: (context) {
              return GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: (MediaQuery.of(context).size.width>MediaQuery.of(context).size.height)?6:4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                padding: EdgeInsets.all(10),
                semanticChildCount: 2,
                shrinkWrap: true,

                // Generate 100 widgets that display their index in the List.
                children: List.generate(6, (index) {
                  return Card(
                      //  color:
                      color: Theme.of(context).cardColor,
                      elevation: 0,
                      margin: EdgeInsets.all(2),
                  child: MaterialButton(
                  padding: EdgeInsets.all(0),
                  height: double.infinity,

                  highlightColor: Color(0xFF363636),
                  elevation: 1,
                  highlightElevation: 0,
                  hoverElevation: 0,
                  shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5) ,
                  borderSide: BorderSide(width:0 , color:Theme.of(context).cardColor)),
                  color: Theme.of(context).cardColor,
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => UnitConverter(unit: titles[index],),
                  ),
                  );
                  },
                  child: Center(
                    child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icons[index],size: 25 ,color: Theme.of(context).primaryColorDark ,),
                          SizedBox(height: 2,),
                        Text(titles[index], style: TextStyle(fontSize: 10,color:Theme.of(context).primaryColorDark)),

                      ],
                    ),
                  ),
                  ));

                    /*Card(
                    color: Theme.of(context).cardColor,

                    child: Center(
                      child: Column(

                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UnitConverter(unit: titles[index],),
                                ),
                              );
                            },
                            icon: Icon(icons[index],size: 16 ,color: Theme.of(context).primaryColorDark ,),
                          ),
                          Text(titles[index], style: TextStyle(fontSize: 12,color:Theme.of(context).primaryColorDark)),

                        ],
                      ),
                    ),
                  );*/
                }),
              );
            });

      }
  ),
);

  }



  Widget _tasksWidget() {
    return Row(


      children: [
        Expanded(
            flex: 1,
            child: MaterialButton(
                        child: Text(Button().rndToDeg ,style: TextStyle(color: Theme.of(context).primaryColorLight),),
              padding: EdgeInsets.all(0),
                        height: double.infinity,
                        color:Color(0xFF363636),
                         onPressed: (){
                          setState(() {
                            (Button().rndToDeg == "Deg")?Button().rndToDeg= "Rnd":Button().rndToDeg= "Deg";

                          });
                         },
                        ),
        ),
        Expanded(
          flex: 4,
          child:_itemsList(),
        ),
        Expanded(
          flex: 1,
          child: MaterialButton(
            height: double.infinity,
            color: Theme.of(context).backgroundColor,
            child: Icon(Icons.history, color: Theme.of(context).primaryColor,),
            onPressed: (){
              Navigator.of(context).pushNamed('/history');
            },
          ),
        ),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*
           * we split the screen on two sections
           * first Section is named "firstSection"  to write an operation , named "_operationWidget".
           * he second Section is named "_secondSectionBody" and split to 4 segments :
           * the first segment to show the result, named "_resultWidget".
           * and second segment to history and copy the result , named "_historyWidget".
           * third segment : contains Big_Pad and Small_Pad.

          */
          
          Expanded(
            /* first Section */
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,

              color: Theme.of(context).backgroundColor,
              child: _operationWidget(),
            ),
          ),

          Expanded(
            /*  Second Section  */
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color:Theme.of(context).backgroundColor,// Color(0xFFDFE0DF),
              child: Column(
                children: [
                  Expanded(
                    /* first segment of Second Section : _resultWidget */
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                    
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                        shape: BoxShape.rectangle,
                       border: Border(
                          top: BorderSide(width: 1.0, color: Theme.of(context).primaryColorDark,),
                          bottom: BorderSide(width: 1.0, color:Theme.of(context).primaryColorDark),
                        ),//color: Theme.of(context).primaryColorDark)
                      ),

                        alignment: Alignment.bottomRight,
                        child: Text((Result!=null)?(Result==0)?Result.toStringAsFixed(0).toString():Result.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""):"Error", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),),
                    ),
                  ),
                  Expanded(
                    /* second segment of Second Section : _tasksWidget */
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          shape: BoxShape.rectangle,
                          border: Border(
                           // top: BorderSide(width: 0.5, color: Theme.of(context).primaryColorDark,),
                            bottom: BorderSide(width: 1.0, color:Theme.of(context).primaryColorDark),
                          ),
                          //border: Border.all(color: Theme.of(context).primaryColorDark)
                      ),
                      child: _tasksWidget(),
                    ),
                  ),
                  Expanded(
                    /* third  segment of Second Section : contains Big_Pad and Small_Pad */
                    flex: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?4:6,
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child:(MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?_bigPad() :_smallPad(),
                    ),
                  ),
            
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



