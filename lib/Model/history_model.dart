import 'dart:convert';

History historyFromJson(String str) {
  final jsonData = json.decode(str);
  return History.fromMap(jsonData);
}

String historyToJson(History data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class History {
  int id;
  String operandExpression;
  String result;


  History({
    this.id,
    this.operandExpression,
    this.result,

  });

  factory History.fromMap(Map<String, dynamic> json) => new History(
    id: json["id"],
    operandExpression: json["operand"],
    result: json["result"],

  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "operand": operandExpression,
    "result": result,

  };


  
}