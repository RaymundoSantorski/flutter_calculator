import 'package:calculator_practice/widgets/equal_button.dart';
import 'package:calculator_practice/widgets/num_button.dart';
import 'package:calculator_practice/widgets/op_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController(text: '');
  List<double> values = [];
  List<double Function(double, double)> ops = [];

  void addValue(String value) {
    _controller.text = _controller.text + value;
  }

  void operate(double Function(double, double) op) {
    setState(() {
      double? value = double.tryParse(_controller.text);
      if (value == null) return;
      values.add(value);
      int currLevel = (op == mult || op == div) ? 2 : 1;
      if (ops.isEmpty) {
        ops.add(op);
      } else {
        int prevLevel = (ops.last == mult || ops.last == div) ? 2 : 1;
        if (prevLevel >= currLevel) {
          double newValue = ops.removeLast()(
            values.removeLast(),
            values.removeLast(),
          );
          ops.add(op);
          values.add(newValue);
        } else {
          ops.add(op);
        }
      }
      _controller.text = '';
    });
    print('----Operate----');
    print(values);
    print(ops);
  }

  void resolve() {
    setState(() {
      double? value = double.tryParse(_controller.text);
      if (value == null) return;
      values.add(value);
      for (int i = (ops.length - 1); i >= 0; i--) {
        double Function(double, double) op = ops.removeLast();
        values.add(op(values.removeLast(), values.removeLast()));
      }
      _controller.text = '${values.removeLast()}';
    });
    print('-----Resolve------');
    print(values);
    print(ops);
  }

  double mult(double b, double a) {
    return a * b;
  }

  double div(double b, double a) {
    return a / b;
  }

  double add(double b, double a) {
    return a + b;
  }

  double sus(double b, double a) {
    return a - b;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: _controller,
              ),
            ),
            Expanded(child: SizedBox()),
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
