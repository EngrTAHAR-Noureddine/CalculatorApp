import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeWidgets extends StatefulWidget {
  @override
  _HomeWidgetsState createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {

  Widget _button(_child ,_colorBox){

    return Expanded(
      child: Card(
        color: _colorBox,
        margin: EdgeInsets.all(5),
        child: FlatButton(
          onPressed: (){},
          child: _child,
        ),
      ),
    );
  }

  List rowButtonsNumbers1=[

                            [ Text("C" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],
                            [ Text("<-", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],
                            [ Text("%" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],
                            [ Text("/" , style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],

                           ];

  List rowButtonsFunctions1=[

                            [ Text("x-1", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                            [ Text("!", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                            [ Text("ln",  style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                            [ Text("exp", style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF4363636)]

                              ];
  List rowButtonsNumbers2=[

                            [Text("7" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("8" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("9" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("X" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],


                            ];
  List rowButtonsFunctions2=[

                              [Text("Log" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("cos",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("sin" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("tan" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],


                            ];
  List rowButtonsNumbers3=[

                            [Text("4" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("5" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("6" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4)],
                            [Text("-" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210)],

                          ];
  List rowButtonsFunctions3=[

                              [Text("x²" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("x^y" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Text("qua",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("pi" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)]

                            ];
  List rowButtonsNumbers4=[

                            [Text("1",style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) ],
                            [Text("2" ,style: TextStyle(color: Color(0xFF707070)))  ,Color(0xFFF4F4F4) ],
                            [Text("3" ,style: TextStyle(color: Color(0xFF707070))) ,Color(0xFFF4F4F4) ],
                            [Text("+" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFFFC8210) ],


                          ];
  List rowButtonsFunctions4=[

                              [Text("10^y" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("cosh",style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Text("sinh" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("tanh" ,style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)]

                            ];
  List rowButtonsNumbers5=[

                            [Text("+/-" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                            [Text("0" ,style: TextStyle(color:  Color(0xFF707070))) ,Color(0xFFF4F4F4)],
                            [Text("." ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                            [Text("=",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFFFC8210)],

                          ];
  List rowButtonsFunctions5=[

                              [Text("(" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Text(")",style: TextStyle(color: Color(0xFFFFFFFF))) ,Color(0xFF363636)],
                              [Text("|x|" ,style: TextStyle(color: Color(0xFFFFFFFF)))  ,Color(0xFF363636)],
                              [Text("e",style: TextStyle(color:Color(0xFFFFFFFF)))  ,Color(0xFF363636)],


                            ];

  List<Widget> _rowButtons(list){



    return new List<Widget>.generate(list.length, (int index) {

      return _button(list[index][0], list[index][1]);
    });

  }
List rowButtons=[4];
bool states = false;

  Widget _switcherWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        MaterialButton(
            child: Text('Functions'), //states is true then functions is active
            padding: EdgeInsets.all(15.0),
            elevation: 0,
            highlightElevation: 0,
          disabledColor: Color(0xFF707070),
          disabledTextColor: Color(0xFFFFFFFF),
            color:(states)?Color(0xFF707070): Color(0xFFFFFFFF),
            textColor:(states)? Color(0xFFFFFFFF):Color(0xFF707070),
         //  splashColor: Colors.green,
            colorBrightness:(states)?Brightness.dark: Brightness.light,

            shape: StadiumBorder(),
            onPressed:(!states)? () {
                      setState(() {
                        states = !states;
                      });
            }:null,

        ),
        MaterialButton(
            child: Text('Numbers'), // states is false so numbers is active
            padding: EdgeInsets.all(15.0),
            elevation: 0,
            highlightElevation: 0,
            disabledColor: Color(0xFF707070),
            disabledTextColor: Color(0xFFFFFFFF),
            color:(!states)?Color(0xFF707070): Color(0xFFFFFFFF),
            textColor:(!states)? Color(0xFFFFFFFF):Color(0xFF707070),
            //  splashColor: Colors.green,
            colorBrightness:(!states)?Brightness.dark: Brightness.light,
            shape: StadiumBorder(),
            onPressed:(states)? () {
              setState(() {
                states = !states;
              });
            }:null,
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
           * third segment : to switch between numbers and functions ,named "_switcherWidget".
           * fourth segment : is the pad 4*5 named "_padWidget".
          */
          
          Expanded(
            /* first Section */
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,

            ),
          ),

          Expanded(
            /*  Second Section  */
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFDFE0DF),
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
                    /* third  segment of Second Section : _switcherWidget */
                    flex: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?0:1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      child: _switcherWidget(),
                    ),
                  ),
              
                  Expanded(
                    /* fourth segment of Second Section : _padWidget */
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      width: MediaQuery.of(context).size.width,

                      alignment: Alignment.center,
                      child: Column(
                       /* mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
                        children: [
                          Expanded(

                            child: Row(
                              
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions1+rowButtonsNumbers1:(states)?rowButtonsFunctions1:rowButtonsNumbers1),
                            ),
                          ),
                          Expanded(
                            child: Row(
                             
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions2+rowButtonsNumbers2:(states)?rowButtonsFunctions2:rowButtonsNumbers2),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions3+rowButtonsNumbers3:(states)?rowButtonsFunctions3:rowButtonsNumbers3),
                            ),
                          ),
                         Expanded(
                           child: Row(
                            
                            children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions4+rowButtonsNumbers4:(states)?rowButtonsFunctions4:rowButtonsNumbers4),
                          ),
                         ),
                          Expanded(
                            child: Row(
                             
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions5+rowButtonsNumbers5:(states)?rowButtonsFunctions5:rowButtonsNumbers5),
                            ),
                          ),
                        ],
                      ),
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
