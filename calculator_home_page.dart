import 'package:flutter/material.dart';
import 'button_row.dart';

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _currentInput = "";
  String _operand = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  bool _isOperatorPressed = false;
  String _selectedOperator = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _currentInput = "";
        _operand = "";
        _num1 = 0.0;
        _num2 = 0.0;
        _output = "0";
        _isOperatorPressed = false;
        _selectedOperator = "";
      } else if (buttonText == "+/-") {
        if (_currentInput.isNotEmpty) {
          _currentInput = (double.parse(_currentInput) * -1).toString();
        }
      } else if (buttonText == "%") {
        if (_currentInput.isNotEmpty) {
          _currentInput = (double.parse(_currentInput) / 100).toString();
        }
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "x") {
        if (_currentInput.isNotEmpty) {
          _num1 = double.parse(_currentInput);
          _operand = buttonText;
          _currentInput = "";
          _output = _num1.toString();
          _isOperatorPressed = true;
          _selectedOperator = buttonText;
        }
      } else if (buttonText == ".") {
        if (_currentInput.contains(".")) {
          return;
        } else {
          _currentInput += buttonText;
        }
      } else if (buttonText == "=") {
        _num2 = double.parse(_currentInput);

        if (_operand == "+") {
          _output = (_num1 + _num2).toString();
        }
        if (_operand == "-") {
          _output = (_num1 - _num2).toString();
        }
        if (_operand == "x") {
          _output = (_num1 * _num2).toString();
        }
        if (_operand == "/") {
          _output = (_num1 / _num2).toString();
        }

        _num1 = 0.0;
        _num2 = 0.0;
        _operand = "";
        _currentInput = _output;
        _isOperatorPressed = false;
        _selectedOperator = "";
      } else {
        _currentInput += buttonText;
        _isOperatorPressed = false;
        _selectedOperator = "";
      }

      if (_currentInput.isEmpty) {
        _output = "0";
      } else if (!_isOperatorPressed) {
        _output = _currentInput.contains('.') ? _currentInput : int.parse(_currentInput).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Divider(color: Colors.grey, height: 1.0),
          Column(
            children: [
              ButtonRow(buttonConfigs: [
                ButtonConfig('AC', Colors.black, Colors.grey, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('+/-', Colors.black, Colors.grey, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('%', Colors.black, Colors.grey, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('/', _selectedOperator == "/" ? Colors.orange : Colors.white, _selectedOperator == "/" ? Colors.white : Colors.orange, borderRadius: BorderRadius.circular(40)),
              ], onPressed: buttonPressed),
              ButtonRow(buttonConfigs: [
                ButtonConfig('7', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('8', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('9', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('x', _selectedOperator == "x" ? Colors.orange : Colors.white, _selectedOperator == "x" ? Colors.white : Colors.orange, borderRadius: BorderRadius.circular(40)),
              ], onPressed: buttonPressed),
              ButtonRow(buttonConfigs: [
                ButtonConfig('4', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('5', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('6', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('-', _selectedOperator == "-" ? Colors.orange : Colors.white, _selectedOperator == "-" ? Colors.white : Colors.orange, borderRadius: BorderRadius.circular(40)),
              ], onPressed: buttonPressed),
              ButtonRow(buttonConfigs: [
                ButtonConfig('1', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('2', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('3', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('+', _selectedOperator == "+" ? Colors.orange : Colors.white, _selectedOperator == "+" ? Colors.white : Colors.orange, borderRadius: BorderRadius.circular(40)),
              ], onPressed: buttonPressed),
              ButtonRow(buttonConfigs: [
                ButtonConfig('0', Colors.white, Colors.grey[850]!, flex: 2, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('.', Colors.white, Colors.grey[850]!, borderRadius: BorderRadius.circular(40)),
                ButtonConfig('=', Colors.white, Colors.orange, borderRadius: BorderRadius.circular(40)),
              ], onPressed: buttonPressed),
            ],
          ),
        ],
      ),
    );
  }
}
