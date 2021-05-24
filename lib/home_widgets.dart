import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeWidgets extends StatefulWidget {
  @override
  _HomeWidgetsState createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {

  Widget _button(String _fill,_colorBox,_colorText){

    return Expanded(
      child: Card(
        color: _colorBox,
        margin: EdgeInsets.all(5),
        child: FlatButton(
          onPressed: (){},
          child: Text(_fill ,style: TextStyle(color: _colorText),),
        ),
      ),
    );
  }

  List rowButtonsNumbers1=[
                            ["C",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                            ["<-",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                            ["%",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                            ["/",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                           ];

  List rowButtonsFunctions1=[
                            ["x-1",Color(0xFF363636), Color(0xFFFFFFFF)],
                            ["X!",Color(0xFF363636), Color(0xFFFFFFFF)],
                            ["ln",Color(0xFF363636), Color(0xFFFFFFFF)],
                            ["exp",Color(0xFF4363636), Color(0xFFFFFFFF)]
                              ];
  List rowButtonsNumbers2=[
                            ["7",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["8",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["9",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["X",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                            ];
  List rowButtonsFunctions2=[
                              ["Log",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["cos",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["sin",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["tan",Color(0xFF363636), Color(0xFFFFFFFF)],
                            ];
  List rowButtonsNumbers3=[
                            ["4",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["5",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["6",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["-",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                          ];
  List rowButtonsFunctions3=[
                              ["x²",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["x^y",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["qua",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["pi",Color(0xFF363636), Color(0xFFFFFFFF)]
                            ];
  List rowButtonsNumbers4=[
                            ["1",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["2",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["3",Color(0xFFF4F4F4), Color(0xFF707070)],
                            ["+",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                          ];
  List rowButtonsFunctions4=[
                              ["10^y",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["cosh",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["sinh",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["tanh",Color(0xFF363636), Color(0xFFFFFFFF)]
                            ];
  List rowButtonsNumbers5=[
                            ["+/-",Color(0xFF363636), Color(0xFFFFFFFF)],
                            ["0",Color(0xFFF4F4F4), Color(0xFF707070)],
                            [".",Color(0xFF363636), Color(0xFFFFFFFF)],
                            ["=",Color(0xFFFC8210), Color(0xFFFFFFFF)],
                          ];
  List rowButtonsFunctions5=[
                              ["(",Color(0xFF363636), Color(0xFFFFFFFF)],
                              [")",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["|x|",Color(0xFF363636), Color(0xFFFFFFFF)],
                              ["e",Color(0xFF363636), Color(0xFFFFFFFF)],
                            ];

  List<Widget> _rowButtons(list){



    return new List<Widget>.generate(list.length, (int index) {

      return _button(list[index][0], list[index][1],list[index][2]);
    });

  }


  List<Widget> _firstSectionBody(){
    List _innerBodyOfFirstContain=[Colors.brown,Colors.yellow,Colors.blue];

    return new List<Widget>.generate(_innerBodyOfFirstContain.length, (int index) {
      return Expanded(
          flex: _innerBodyOfFirstContain.length-index,
          child: Container(
            width: double.infinity,
            color: _innerBodyOfFirstContain[index],
            child: Text( index.toString()),

          )
      );
    });

  }





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*
           * we splite the screen on two sections
           * first Section is named "_firstSectionBody" and is splited to 3 segments :
           * the first segment to write an operation , named "_operationWidget".
           * the second segment to show the result, named "_resultWidget".
           * and third segment to history and copy the result , named "_historyWidget".
           * the second Section is named "_secondSectionBody" and is splited to 2 segments :
           * first segment : to switch between numbers and functions ,named "_switcherWidget".
           * second segment : is the pad 4*5 named "_padWidget".
          */
          
          Expanded(
            /* first Section */
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Column(
                children: _firstSectionBody(),
              ),
            ),
          ),
          
          Expanded(
            /* first segment of Second Section : _switcherWidget */
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Column(
                children: [
                  Expanded(
                    flex: (MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?0:1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,

                    ),
                  ),
              
                  Expanded(
                    /* second segment of Second Section : _padWidget */
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pinkAccent,
                      alignment: Alignment.center,
                      child: Column(
                       /* mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
                        children: [
                          Expanded(

                            child: Row(
                              
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions1+rowButtonsNumbers1:rowButtonsNumbers1),
                            ),
                          ),
                          Expanded(
                            child: Row(
                             
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions2+rowButtonsNumbers2:rowButtonsNumbers2),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions3+rowButtonsNumbers3:rowButtonsNumbers3),
                            ),
                          ),
                         Expanded(
                           child: Row(
                            
                            children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions4+rowButtonsNumbers4:rowButtonsNumbers4),
                          ),
                         ),
                          Expanded(
                            child: Row(
                             
                              children: _rowButtons((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?rowButtonsFunctions5+rowButtonsNumbers5:rowButtonsNumbers5),
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
