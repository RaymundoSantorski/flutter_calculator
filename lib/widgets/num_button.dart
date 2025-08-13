import 'package:flutter/material.dart';

class NumButton extends StatelessWidget {
  const NumButton({
    super.key,
    required this.onPressed,
    required this.value,
    required this.color,
  });
  final void Function(String) onPressed;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          onPressed: () {
            onPressed(value);
          },
          child: Text(
            value,
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
