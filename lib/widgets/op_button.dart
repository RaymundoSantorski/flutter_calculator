import 'package:flutter/material.dart';

class OpButton extends StatelessWidget {
  const OpButton({
    super.key,
    required this.onPressed,
    required this.operation,
    required this.label,
    required this.active,
  });
  final void Function(double Function(double, double), BuildContext) onPressed;
  final double Function(double, double) operation;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              active ? Colors.amber : Colors.orange,
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          onPressed: () {
            onPressed(operation, context);
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
