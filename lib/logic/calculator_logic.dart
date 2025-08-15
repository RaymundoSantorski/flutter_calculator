import 'package:calculator_practice/logic/methods.dart';
import 'package:flutter/material.dart';

class CalculatorLogic extends StatefulWidget {
  const CalculatorLogic({super.key});

  @override
  State<CalculatorLogic> createState() => CalculatorLogicState();
}

class CalculatorLogicState<T extends CalculatorLogic> extends State<T> {
  final TextEditingController controller = TextEditingController(text: '0');
  List<double> values = [];
  List<double Function(double, double)> ops = [];
  double Function(double, double)? currentOp;
  bool overwrite = false;
  List<String> history = [];

  SnackBar snackBar(String message) {
    return SnackBar(content: Text(message), backgroundColor: Colors.redAccent);
  }

  void showMessage(context, message) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar(message));
  }

  String formatText(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    }
    return '$value';
  }

  void clearText() {
    controller.text = '0';
  }

  void validateHistory() {
    if (currentOp != null &&
        history.isNotEmpty &&
        !history.last.contains('=')) {
      setState(() {
        history.removeLast();
      });
    }
  }

  void resetCalculatorState() {
    clearText();
    validateHistory();
    setState(() {
      currentOp = null;
      values = [];
      ops = [];
    });
  }

  void deleteChar() {
    if (controller.text.isEmpty || controller.text == '0') return;
    controller.text = controller.text.substring(0, controller.text.length - 1);
    if (controller.text.isEmpty) controller.text = '0';
  }

  void addValue(String value) {
    if (overwrite) {
      controller.text = value;
      overwrite = false;
      return;
    }
    if (controller.text.contains('.') && value == '.') return;
    if (controller.text == '0' && value != '.') {
      controller.text = value;
      return;
    }
    controller.text = controller.text + value;
  }

  void resolve(BuildContext context) {
    try {
      setState(() {
        double? value = double.tryParse(controller.text);
        if (value == null) return;
        currentOp = null;
        values.add(value);
        equal();
        controller.text = formatText(values.removeLast());
        history.add('${history.removeLast()} $value = ${controller.text}');
        overwrite = true;
      });
    } catch (error) {
      showMessage(context, error.toString());
    }
  }

  void equal() {
    while (ops.isNotEmpty) {
      values.add(ops.removeLast()(values.removeLast(), values.removeLast()));
    }
  }

  void changeOp(double Function(double, double) op) {
    String curr = history.removeLast();
    history.add('${curr.substring(0, curr.length - 1)}${getOperand(op)}');
    ops.removeLast();
    currentOp = op;
    ops.add(op);
  }

  String getOperand(op) {
    String operand = op == add
        ? '+'
        : op == sus
        ? '-'
        : op == mult
        ? '*'
        : '/';
    return operand;
  }

  bool doPrevOps(double Function(double, double) op) {
    try {
      int currLevel = (op == mult || op == div) ? 2 : 1;
      int prevLevel = (ops.last == mult || ops.last == div) ? 2 : 1;
      return prevLevel >= currLevel;
    } catch (error) {
      return false;
    }
  }

  void setHistory(double value, double Function(double, double) op) {
    if (currentOp == null) {
      history.add('${formatText(value)} ${getOperand(op)}');
    } else {
      String curr =
          '${history.removeLast()} ${formatText(value)} ${getOperand(op)}';
      history.add(curr);
    }
  }

  void operate(double Function(double, double) op, BuildContext context) {
    try {
      setState(() {
        if (currentOp != null && overwrite) {
          changeOp(op);
          return;
        }
        double? value = double.tryParse(controller.text);
        if (value == null) return;
        if (op == percentage) {
          controller.text = '${percentage(value, 100)}';
          return;
        }
        values.add(value);
        setHistory(value, op);
        if (doPrevOps(op)) equal();
        ops.add(op);
        currentOp = op;
        controller.text = formatText(values.last);
        overwrite = true;
      });
    } catch (error) {
      showMessage(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
