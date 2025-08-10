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
  TextEditingController _controller = TextEditingController(text: '');

  void addValue(String value) {
    _controller.text = _controller.text + value;
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
                  child: ElevatedButton(onPressed: () {}, child: Text('7')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('8')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('9')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('+')),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('4')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('5')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('6')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('-')),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('1')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('2')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('3')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('*')),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('.')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('0')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('=')),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {}, child: Text('/')),
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
