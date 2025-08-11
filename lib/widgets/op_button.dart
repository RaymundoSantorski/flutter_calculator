import 'package:flutter/material.dart';

class OpButton extends StatelessWidget {
  const OpButton({
    super.key,
    required this.onPressed,
    required this.operation,
    required this.label,
  });
  final void Function(double Function(double, double)) onPressed;
  final double Function(double, double) operation;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.orange),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          onPressed: () {
            onPressed(operation);
          },
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
