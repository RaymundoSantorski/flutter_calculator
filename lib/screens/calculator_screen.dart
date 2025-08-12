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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            TextField(
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(border: InputBorder.none),
              controller: controller,
            ),
            Row(
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
              ],
            ),
            Row(
              children: [
                NumButton(onPressed: addValue, value: '7'),
                NumButton(onPressed: addValue, value: '8'),
                NumButton(onPressed: addValue, value: '9'),
                OpButton(onPressed: operate, operation: add, label: '+'),
              ],
            ),
            Row(
              children: [
                NumButton(onPressed: addValue, value: '4'),
                NumButton(onPressed: addValue, value: '5'),
                NumButton(onPressed: addValue, value: '6'),
                OpButton(onPressed: operate, operation: sus, label: '-'),
              ],
            ),
            Row(
              children: [
                NumButton(onPressed: addValue, value: '1'),
                NumButton(onPressed: addValue, value: '2'),
                NumButton(onPressed: addValue, value: '3'),
                OpButton(onPressed: operate, operation: mult, label: '*'),
              ],
            ),
            Row(
              children: [
                NumButton(onPressed: addValue, value: '.'),
                NumButton(onPressed: addValue, value: '0'),
                EqualButton(onPressed: resolve),
                OpButton(onPressed: operate, operation: div, label: '/'),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
