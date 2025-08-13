import 'package:calculator_practice/logic/calculator_logic.dart';
import 'package:calculator_practice/logic/methods.dart';
import 'package:calculator_practice/widgets/del_button.dart';
import 'package:calculator_practice/widgets/equal_button.dart';
import 'package:calculator_practice/widgets/num_button.dart';
import 'package:calculator_practice/widgets/op_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends CalculatorLogic {
  const CalculatorScreen({super.key, required this.title});
  final String title;
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends CalculatorLogicState<CalculatorScreen> {
  bool _darkMode = true;
  final double spacing = 8;

  void setNightMode(value) {
    setState(() {
      _darkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = _darkMode
        ? ColorScheme.dark().copyWith(
            primary: Color.fromRGBO(20, 20, 20, 1),
            secondary: Color.fromRGBO(50, 50, 50, 1),
            onPrimary: Color.fromRGBO(250, 250, 250, 1),
            onSecondary: Color.fromRGBO(255, 250, 255, 1),
            secondaryContainer: Color.fromRGBO(50, 50, 50, 1),
          )
        : ColorScheme.light().copyWith(
            primary: Color.fromRGBO(235, 240, 240, 1),
            secondary: Color.fromRGBO(150, 150, 180, 1),
            onSecondary: Color.fromRGBO(20, 20, 20, 1),
            secondaryContainer: Color.fromRGBO(100, 110, 100, 1),
          );
    return Scaffold(
      backgroundColor: scheme.primary,
      appBar: AppBar(
        backgroundColor: scheme.secondary,
        title: Text(
          widget.title,
          style: TextStyle(
            color: scheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Switch(
            value: _darkMode,
            onChanged: setNightMode,
            activeColor: scheme.secondary,
            activeTrackColor: scheme.primary,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(5),
          child: Column(
            spacing: spacing,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              TextField(
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: scheme.onSecondary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(border: InputBorder.none),
                controller: controller,
              ),
              Row(
                spacing: spacing,
                children: [
                  DelButton(
                    onPressed: clearText,
                    backgroundColor: Colors.redAccent,
                    label: 'C',
                  ),
                  DelButton(
                    onPressed: resetCalculatorState,
                    backgroundColor: Colors.red,
                    label: 'AC',
                  ),
                  DelButton(
                    onPressed: deleteChar,
                    backgroundColor: Colors.blueGrey,
                    label: 'DEL',
                  ),
                  OpButton(
                    onPressed: operate,
                    operation: percentage,
                    label: '%',
                  ),
                ],
              ),
              Row(
                spacing: spacing,
                children: [
                  NumButton(
                    onPressed: addValue,
                    value: '7',
                    color: scheme.secondary,
                  ),
                  NumButton(
                    onPressed: addValue,
                    value: '8',
                    color: scheme.secondary,
                  ),
                  NumButton(
                    onPressed: addValue,
                    value: '9',
                    color: scheme.secondary,
                  ),
                  OpButton(onPressed: operate, operation: add, label: '+'),
                ],
              ),
              Row(
                spacing: spacing,
                children: [
                  NumButton(
                    onPressed: addValue,
                    value: '4',
                    color: scheme.secondary,
                  ),
                  NumButton(
                    onPressed: addValue,
                    value: '5',
                    color: scheme.secondary,
                  ),
                  NumButton(
                    onPressed: addValue,
                    value: '6',
                    color: scheme.secondary,
                  ),
                  OpButton(onPressed: operate, operation: sus, label: '-'),
                ],
              ),
              Row(
                spacing: spacing,
                children: [
                  NumButton(
                    onPressed: addValue,
                    value: '1',
                    color: scheme.secondary,
                  ),
                  NumButton(
                    onPressed: addValue,
                    value: '2',
                    color: scheme.secondary,
                  ),
                  NumButton(
                    onPressed: addValue,
                    value: '3',
                    color: scheme.secondary,
                  ),
                  OpButton(onPressed: operate, operation: mult, label: '*'),
                ],
              ),
              Row(
                spacing: spacing,
                children: [
                  NumButton(
                    onPressed: addValue,
                    value: '.',
                    color: scheme.secondary,
                  ),
                  NumButton(
                    onPressed: addValue,
                    value: '0',
                    color: scheme.secondary,
                  ),
                  EqualButton(onPressed: resolve, color: scheme.onPrimary),
                  OpButton(onPressed: operate, operation: div, label: '/'),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
