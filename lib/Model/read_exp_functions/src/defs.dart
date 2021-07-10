part of function_tree;

/// A mapping of string representations to two-parameter functions.
final Map<String, num Function(num, num)> _twoParameterFunctionMap = {
  'log': (num b, num x) => log(x) / log(b),
  'nrt': (num n, num x) => pow(x, 1 / n),
  'pow': (num x, num p) => pow(x, p)
};

/// A mapping of string representations of functions to LaTeX.
final Map<String, String> _twoParameterFunctionLatexRepresentation = {
  'log': r'\log_{C1}\left(C2\right)',
  'nrt': r'\sqrt[C1]{C2}',
  'pow': r'{C1}^{C2}'
};
bool isInteger(num value) =>
    value is int || value == value.roundToDouble();
num factorial(num n) {
  if(isInteger(n)){
  if (n < 0) throw ('Negative numbers are not allowed.');
  return n <= 1 ? 1 : n * factorial(n - 1);
  }else throw ("Error");
}

/// A mapping of string representations to functions.
final Map<String, num Function(num)> _oneParameterFunctionMap = {
  'abs': (num x) => x.abs(),
  '!': (num x) => factorial(x),
  'acosR':(num x)=> acos(x),
  'acosD': (num x)=> num.parse((( acos(x) / pi) *180.0 ).toStringAsFixed(2)),
  'asinR': (num x)=>asin(x),
  'asinD': (num x)=> num.parse( (( asin(x) / pi ) *180.0 ).toStringAsFixed(2)),
  'atanR': (num x)=>atan(x),
  'atanD': (num x)=> num.parse((atan(x)*180/pi).toStringAsFixed(2)),
  'ceil': (num x) => x.ceil(),
  'cosD': (num x)=> cos((x / 180.0) * pi),
  'cosR': (num x)=>cos(x),
  'cosh': (num x) => (pow(e, x) + pow(e, -x)) / 2,
  'cot': (num x) => 1 / tan(x),
  'coth': (num x) => (pow(e, x) + pow(e, -x)) / (pow(e, x) - pow(e, -x)),
  'csc': (num x) => 1 / sin(x),
  'csch': (num x) => 2 / (pow(e, x) - pow(e, -x)),
  'exp': exp,
  'floor': (num x) => x.floor(),
  'ln':log,
  'log': (num x)=> log(x)/log(10),
  'round': (num x) => x.round(),
  'sec': (num x) => 1 / cos(x),
  'sech': (num x) => 2 / (pow(e, x) + pow(e, -x)),
  'sinR': (num x)=>sin(x),
  'sinD': (num x)=> sin((x / 180.0) * pi),
  'sinh': (num x) => (pow(e, x) - pow(e, -x)) / 2,
  String.fromCharCode(0x221A) : sqrt,
  'tanR': (num x)=>tan(x),
  'tanD': (num x)=>tan(x*pi/ 180),

  'tanh': (num x) => (pow(e, x) - pow(e, -x)) / (pow(e, x) + pow(e, -x))
};

/// A mapping of string representations of functions to LaTeX.
final Map<String, String> _oneParameterFunctionLatexRepresentation = {
  'abs': r'\left| C \right| ',
  'acosR': r'\arccos\left( C \right) ',
  'acosD': r'\arccos\left( C \right) ',
  '!': r'\!\left( C \right) ',
  'asinR': r'\arcsin\left( C \right) ',
  'asinD': r'\arcsin\left( C \right) ',

  'atanR': r'\arctan\left( C \right) ',
  'atanD': r'\arctan\left( C \right) ',

  'ceil': r'\lceil C \rceil ',
  'cosR': r'\cos\left( C \right) ',
  'cosD': r'\cos\left( C \right) ',

  'cosh': r'\cosh\left( C \right) ',
  'cot': r'\cot\left( C \right) ',
  'coth': r'\coth\left( C \right) ',
  'csc': r'\csc\left( C \right) ',
  'csch': r'\csch\left( C \right) ',
  'exp': r'\exp\left( C \right) ',
  'floor': r'\lfloor C \rfloor ',
  'ln': r'\ln\left( C \right) ',
  'log': r'\log\left( C \right) ',
  'round': r'\left[ C \right] ',
  'sec': r'\sec\left( C \right) ',
  'sech': r'\sech\left( C \right) ',
  'sinR': r'\sin\left( C \right) ',
  'sinD': r'\sin\left( C \right) ',
  'sinh': r'\sinh\left( C \right) ',
  String.fromCharCode(0x221A) : r'\sqrt{ C } ',
  'tanR': r'\tan\left( C \right) ',
  'tanD': r'\tan\left( C \right) ',
  'tanh': r'\tanh\left( C \right) '
};

/// A mapping of string representations to constants.
final Map<String, num> _constantMap = {
  'E': e,
  String.fromCharCode(0x03C0): pi,
  'LN2': ln2,
  'LN10': ln10,
  'LOG2E': log2e,
  'LOG10E': log10e,
  'SQRT1_2': sqrt1_2,
  'SQRT2': sqrt2,
  'e': e,
  String.fromCharCode(0x03C0): pi,
  'ln2': ln2,
  'ln10': ln10,
  'log2e': log2e,
  'log10e': log10e,
  'sqrt1_2': sqrt1_2,
  'sqrt2': sqrt2,
};

/// A mapping of string representations of constants to LaTeX.
final Map<String, String> _constantLatexRepresentation = {
  'E': 'e ',
  'LN2': r'\ln 2 ',
  'LN10': r'\ln 10 ',
  'LOG2E': r'\log_2e ',
  'LOG10E': r'\log_{10} e ',
  String.fromCharCode(0x03C0): r'\pi ',
  'SQRT1_2': r'\frac{\sqrt2}{2} ',
  'SQRT2': r'\sqrt{2} ',
  'e': 'e ',
  'ln2': r'\ln 2 ',
  'ln10': r'\ln 10 ',
  'log2e': r'\log_2e ',
  'log10e': r'\log_{10} e ',
  String.fromCharCode(0x03C0): r'\pi ',
  'sqrt1_2': r'\frac{\sqrt2}{2} ',
  'sqrt2': r'\sqrt{2} '
};
