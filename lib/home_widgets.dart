import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:calculatorflutter/function_tree.dart';
import 'my_flutter_app_icons.dart';

class HomeWidgets extends StatefulWidget {
  @override
  _HomeWidgetsState createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
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
                            } else {
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

                 //print(f.text.interpret());
                 tempText  =f.text;
                setState(() {

                  if(rndToDeg == "Deg"){
                    tempText = tempText.replaceAll("cos(","acos(");

                  }else{
                    tempText = tempText.replaceAll("acos(","cos(");
                  }
                  Result = tempText.interpret();
                  print(tempText.interpret());
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
        color: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.all(5),
        child: MaterialButton(
          padding: EdgeInsets.all(0),
          highlightColor: Color(0xFF363636),
          elevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5) ,
                    borderSide: BorderSide(width:0 , color:(_colorBox==Color(0xFFF4F4F4))? Colors.black : Colors.transparent,)),
          color: _colorBox,
          onPressed: ()=> _onPressedButton(_tapping),
          child: _child,
        ),
      ),
    );
  }

  List rowButtonsNumbers1=[

                            [ Text("C" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "init"],
                            [ Icon(Icons.arrow_back , color: Color(0xFFFFFFFF),)  ,Color(0xFFFC8210) , "remove"],
                            [ Text("%" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "%"],
                            [ Text("/" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "/"],

                           ];

  List rowButtonsFunctions1=[

                            [Text("X\u207B\u00B9", style: TextStyle(color: Color(0xFFFFFFFF) ,))  ,Color(0xFF363636) , "^(-1)"],
                            [ Text("!", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "!"],
                            [ Text("ln",  style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "ln("],
                            [ Text("e\u02e3", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF4363636) ,"e^"]

                              ];
  List rowButtonsNumbers2=[

                            [Text("7" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "7"],
                            [Text("8" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "8"],
                            [Text("9" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "9"],
                            [Text("X" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) , "*"],


                            ];
  List rowButtonsFunctions2=[

                              [Text("(" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "("],
                              [Text(")",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,")"],
                              [Text("x²" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "^(2)"],
                              [Text("x\u02b8" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"^("],


                            ];
  List rowButtonsNumbers3=[

                            [Text("4" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "4"],
                            [Text("5" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "5"],
                            [Text("6" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "6"],
                            [Text("-",style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) ,"-"],

                          ];
  List rowButtonsFunctions3=[

                              [Text("10\u02b8" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "*10^("],
                              [Text("Log\u2081\u2080" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) ,"log("],
                              [Icon(MyFlutterApp.square_root_alt,size: 16 ,color: Color(0xFFFFFFFF) ,) ,Color(0xFF363636) ,String.fromCharCode(0x221A)+"("],
                              [Icon(MyFlutterApp.pi ,size: 18 ,color: Color(0xFFFFFFFF) ,) ,Color(0xFF363636) ,String.fromCharCode(0x03C0)]

                            ];
  List rowButtonsNumbers4=[

                            [Text("1",style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) , "1"],
                            [Text("2" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) , "2" ],
                            [Text("3" ,style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) ,"3" ],
                            [Text("+" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) ,"+" ],


                          ];
  List rowButtonsFunctions4=[

                              [Text("sin" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) , "sin("],
                              [Text("cos",style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "cos("],
                              [Text("tan" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"tan("],
                              [Text("|x|" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"abs("]

                            ];
  List rowButtonsNumbers5=[

                            [Text("+/-" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "*(-1)"],
                            [Text("0" ,style: TextStyle(color:  Color(0xFF707070))) ,Color(0xFFF4F4F4) , "0"],
                            [Text("." ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "."],
                            [Text("=",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFFFC8210) , "="],

                          ];
  List rowButtonsFunctions5=[

                              [Text("cosh" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "cosh("],
                              [Text("sinh",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636) ,"sinh("],
                              [Text("tanh" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636) ,"tanh("],
                              [Text("ln2",style: TextStyle(color:Color(0xFFFFFFFF)))  ,Color(0xFF363636) , "ln2"],


                            ];

  List<Widget> _rowButtons(list){



    return new List<Widget>.generate(list.length, (int index) {

      return _button(list[index][0], list[index][1] ,list[index][2]);
    });

  }
List rowButtons=[4];
bool states = false;

Widget _bigPad(){

  return Container(
    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
    width: MediaQuery.of(context).size.width,

    alignment: Alignment.center,
    child: Column(
      /* mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
      children: [
        Expanded(

          child: Row(

            children: _rowButtons(rowButtonsFunctions1+rowButtonsNumbers1),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(rowButtonsFunctions2+rowButtonsNumbers2),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(rowButtonsFunctions3+rowButtonsNumbers3),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(rowButtonsFunctions4+rowButtonsNumbers4),
          ),
        ),
        Expanded(
          child: Row(

            children: _rowButtons(rowButtonsFunctions5+rowButtonsNumbers5),
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title:TabBar(
            indicatorColor: Color(0xFF707070),
            unselectedLabelColor: Colors.black,
            labelColor: Color(0xFF707070),

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

                      children: _rowButtons(rowButtonsFunctions1),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(rowButtonsFunctions2),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _rowButtons(rowButtonsFunctions3),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(rowButtonsFunctions4),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(rowButtonsFunctions5),
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

                      children: _rowButtons(rowButtonsNumbers1),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(rowButtonsNumbers2),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _rowButtons(rowButtonsNumbers3),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(rowButtonsNumbers4),
                    ),
                  ),
                  Expanded(
                    child: Row(

                      children: _rowButtons(rowButtonsNumbers5),
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
    return GestureDetector(
      child:TextField(
          showCursor: isShowCursor,
          readOnly: true,
        autofocus: true,
        controller: f,

        onTap: () {
         setState(() {
           isShowCursor = true;
         });
          txtselct = f.selection;
            if(["a","b","c", "g","h","i", "l","n","o" ,"s","t"].contains(f.text[f.selection.baseOffset - 1])){
               f.selection = TextSelection(
                   baseOffset: (f.text.indexOf("(", f.selection.baseOffset))+1,
                   extentOffset: (f.text.indexOf("(", f.selection.baseOffset))+1);
            }
           print(f.selection);


        },
        decoration: InputDecoration(

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.amber,
              style: BorderStyle.solid,
            ),
          ),
        ),
        toolbarOptions: ToolbarOptions(
          cut: true,
          copy: true,
          selectAll: true,
          paste: false,
        ),
      ),
    );
  }
  String rndToDeg = "Deg";
  Widget _tasksWidget() {
    return Row(


      children: [
        Expanded(
            flex: 1,
            child: MaterialButton(
                        child: Text(rndToDeg),
              padding: EdgeInsets.all(0),
                        height: double.infinity,
                        color: Colors.amber,
                         onPressed: (){
                          setState(() {
                            (rndToDeg == "Deg")?rndToDeg= "Rnd":rndToDeg= "Deg";

                          });
                         },
                        ),
        ),
        Expanded(
          flex: 4,
          child: Container(color: Colors.blue,)
        ),
        Expanded(
          flex: 1,
          child: MaterialButton(
            height: double.infinity,
            child: Icon(Icons.history, color: Colors.white,),
            onPressed: (){

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
              color: Colors.red,
              child: _operationWidget(),
            ),
          ),

          Expanded(
            /*  Second Section  */
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color:Colors.white,// Color(0xFFDFE0DF),
              child: Column(
                children: [
                  Expanded(
                    /* first segment of Second Section : _resultWidget */
                    flex: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?0:1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white38,
                        child: Text(Result.toString()),
                    ),
                  ),
                  Expanded(
                    /* second segment of Second Section : _tasksWidget */
                    flex: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?0:1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(0),
                      color: Colors.black,
                      child: _tasksWidget(),
                    ),
                  ),
                  Expanded(
                    /* third  segment of Second Section : contains Big_Pad and Small_Pad */
                    flex: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?5:6,
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


