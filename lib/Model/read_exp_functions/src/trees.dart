part of function_tree;

final _filth = RegExp(r'[^0-9a-zA-Z_.+\-/*%^(),^[\x00-\x7F]+$]');
String _cleanExpression(String expression) {
  return expression.replaceAll(_filth, '');
}

String _cleanTeX(String expression) {
  final patternStart = r'\left( \left(', patternEnd = r'\right) \right)';
  while (expression.contains(patternStart)) {
    final start = expression.indexOf(patternStart),
        end = _indexOfClosingParenthesis(
            expression, start, patternStart, patternEnd);
    expression = expression
        .replaceFirst(patternStart, r'\left(       ', start)
        .replaceFirst(patternEnd, r'\right)        ', end);
  }
  return expression.replaceAll(RegExp(' +'), ' ').trim();
}

/// Parent for `SingleVariableFunction` and `MultiVariableFunction` classes.
abstract class FunctionTree {
  String get tex;
}

/// A callable class built from a string representation of a
/// multivariable numerical function.
///
class MultiVariableFunction extends FunctionTree {
  MultiVariableFunction(
      { String fromExpression,  List<String> withVariables}) {
    tree = _parseString(_cleanExpression(fromExpression), withVariables);
    _variablesToMap = List<String>.from(withVariables);
  }

   List<String> _variablesToMap;

   _Node tree;

  @override
  String get tex => _cleanTeX(tree.toTeX());

  num call(Map<String, num> vs) => tree(Map<String, num>.fromIterable(
      vs.keys.where((key) => _variablesToMap.contains(key)),
      value: (key) => vs[key]));

  @override
  String toString() => tree.toString();
}

/// A callable class built from a string representation of a
/// numerical function.
///
class SingleVariableFunction extends FunctionTree {
  SingleVariableFunction(
      { String fromExpression, String withVariable = 'x'}) {
    tree = _parseString(_cleanExpression(fromExpression), [withVariable]);
    _variable = withVariable;
  }
   _Node tree;
   String _variable;

  @override
  String get tex => _cleanTeX(tree.toTeX());

  num call(num x) => tree({_variable: x});
}
