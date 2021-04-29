import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeFunction extends StatefulWidget {
  @override
  _HomeFunctionState createState() => _HomeFunctionState();
}

class _HomeFunctionState extends State<HomeFunction> {

  Widget Button(String fill,color){

    return Expanded(
      child: Card(
        color: color,
        margin: EdgeInsets.all(5),
        child: FlatButton(
          onPressed: (){},
          child: Text(fill),
        ),
      ),
    );
  }

  List row10=[
    ["C",Colors.orange],
    ["<-",Colors.orange],
    ["%",Colors.orange],
    ["/",Colors.orange]
              ];
  List row11=[["e",Colors.white],["f",Colors.lightBlueAccent],["g",Colors.lightBlueAccent],["h",Colors.lightBlueAccent]];
  List row20=[["a",Colors.white],["b",Colors.white],["c",Colors.white],["d",Colors.orange]];
  List row21=[["e",Colors.lightBlueAccent],["f",Colors.lightBlueAccent],["g",Colors.lightBlueAccent],["h",Colors.lightBlueAccent]];
  List row30=[["a",Colors.white],["b",Colors.white],["c",Colors.white],["d",Colors.orange]];
  List row31=[["e",Colors.lightBlueAccent],["f",Colors.lightBlueAccent],["g",Colors.lightBlueAccent],["h",Colors.lightBlueAccent]];
  List row40=[["a",Colors.white],["b",Colors.white],["c",Colors.white],["d",Colors.orange]];
  List row41=[["e",Colors.lightBlueAccent],["f",Colors.lightBlueAccent],["g",Colors.lightBlueAccent],["h",Colors.lightBlueAccent]];
  List row50=[["a",Colors.white],["b",Colors.white],["c",Colors.white],["d",Colors.orange]];
  List row51=[["e",Colors.lightBlueAccent],["f",Colors.lightBlueAccent],["g",Colors.lightBlueAccent],["h",Colors.lightBlueAccent]];

  List<Widget> _ContainOfRow(list){



    return new List<Widget>.generate(list.length, (int index) {

      return Botton(list[index][0], list[index][1]);
    });

  }


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
                      child: Column(
                       /* mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
                        children: [
                          Expanded(

                            child: Row(
                              
                              children: _ContainOfRow((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?row11+row10:row10),
                            ),
                          ),
                          Expanded(
                            child: Row(
                             
                              children: _ContainOfRow((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?row21+row20:row20),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: _ContainOfRow((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?row31+row30:row30),
                            ),
                          ),
                         Expanded(
                           child: Row(
                            
                            children: _ContainOfRow((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?row41+row40:row40),
                          ),
                         ),
                          Expanded(
                            child: Row(
                             
                              children: _ContainOfRow((MediaQuery.of(context).size.width > MediaQuery.of(context).size.height)?row51+row50:row50),
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
