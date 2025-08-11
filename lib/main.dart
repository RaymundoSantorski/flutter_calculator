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
          double newValue = op(values.removeLast(), values.removeLast());
          values.add(newValue);
        } else {
          ops.add(op);
        }
      }
      _controller.text = '';
    });
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
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('7'),
                    child: Text('7'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('8'),
                    child: Text('8'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('9'),
                    child: Text('9'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operate(add),
                    child: Text('+'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () => addValue('4'),
                      child: Text('4'),
                    ),
                  ),
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () => addValue('5'),
                      child: Text('5'),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('6'),
                    child: Text('6'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operate(sus),
                    child: Text('-'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('1'),
                    child: Text('1'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('2'),
                    child: Text('2'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('3'),
                    child: Text('3'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operate(mult),
                    child: Text('*'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('.'),
                    child: Text('.'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => addValue('0'),
                    child: Text('0'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: resolve, child: Text('=')),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => operate(div),
                    child: Text('/'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
