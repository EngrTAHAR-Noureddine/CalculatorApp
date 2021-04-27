import 'package:flutter/material.dart';

class HomeFunction extends StatefulWidget {
  @override
  _HomeFunctionState createState() => _HomeFunctionState();
}

class _HomeFunctionState extends State<HomeFunction> {



  List<Widget> _InnerFirstContain(double widthOfScreen){
    List _innerBodyOfFirstContain=[Colors.brown,Colors.yellow,Colors.blue];

    return new List<Widget>.generate(_innerBodyOfFirstContain.length, (int index) {
      return Expanded(
          flex: _innerBodyOfFirstContain.length-index,
          child: Container(
            width: widthOfScreen,
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
          /***
           * we splite the screen on two parties
           * first has three parties we named "InnerFirstContain":
           * the first to write an operation
           * the second to show the result
           * and third to history and copy the result
           * the second has two parties :
           * first : to switch between numbers and functions
           * second : is the pad 4*5
           * ***/
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Column(
                children: _InnerFirstContain(MediaQuery.of(context).size.width),
              ),
            ),
          ),
          Expanded(
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
                  /// this is for number pad and functions
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pinkAccent,
                      alignment: Alignment.center,
                      /*child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _createChildren((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?someList+someList2:someList),
                          ),
                        ],
                      ),*/
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
