import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'my_flutter_app_icons.dart';

class HomeWidgets extends StatefulWidget {
  @override
  _HomeWidgetsState createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {

  Widget _button(_child ,_colorBox){

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
          onPressed: (){},
          child: _child,
        ),
      ),
    );
  }

  List rowButtonsNumbers1=[

                            [ Text("C" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],
                            [ Icon(Icons.arrow_back , color: Color(0xFFFFFFFF),)  ,Color(0xFFFC8210)],
                            [ Text("%" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],
                            [ Text("/" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],

                           ];

  List rowButtonsFunctions1=[

                            [Text("X\u207B\u00B9", style: TextStyle(color: Color(0xFFFFFFFF) ,))  ,Color(0xFF363636)],
                            [ Text("!", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                            [ Text("ln",  style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                            [ Text("e\u02e3", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF4363636)]

                              ];
  List rowButtonsNumbers2=[

                            [Text("7" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("8" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("9" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("X" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],


                            ];
  List rowButtonsFunctions2=[

                              [Text("(" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text(")",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("x²" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("x\u02b8" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],


                            ];
  List rowButtonsNumbers3=[

                            [Text("4" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("5" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("6" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("-" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],

                          ];
  List rowButtonsFunctions3=[

                              [Text("10\u02b8" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("Log\u2081\u2080" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Icon(MyFlutterApp.square_root_alt,size: 16 ,color: Color(0xFFFFFFFF) ,) ,Color(0xFF363636)],
                              [Icon(MyFlutterApp.pi ,size: 18 ,color: Color(0xFFFFFFFF) ,) ,Color(0xFF363636)]

                            ];
  List rowButtonsNumbers4=[

                            [Text("1",style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) ],
                            [Text("2" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) ],
                            [Text("3" ,style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) ],
                            [Text("+" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) ],


                          ];
  List rowButtonsFunctions4=[

                              [Text("sin" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("cos",style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Text("tan" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("|x|" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)]

                            ];
  List rowButtonsNumbers5=[

                            [Text("+/-" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                            [Text("0" ,style: TextStyle(color:  Color(0xFF707070))) ,Color(0xFFF4F4F4)],
                            [Text("." ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                            [Text("=",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFFFC8210)],

                          ];
  List rowButtonsFunctions5=[

                              [Text("cosh" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Text("sinh",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("tanh" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Text("e",style: TextStyle(color:Color(0xFFFFFFFF)))  ,Color(0xFF363636)],


                            ];

  List<Widget> _rowButtons(list){



    return new List<Widget>.generate(list.length, (int index) {

      return _button(list[index][0], list[index][1]);
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


  Widget _operationWidget(){
    return ;
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
                      color: Colors.blue,

                    ),
                  ),
                  Expanded(
                    /* second segment of Second Section : _historyWidget */
                    flex: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?0:1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,

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
