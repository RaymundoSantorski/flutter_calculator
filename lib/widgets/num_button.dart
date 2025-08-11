import 'package:flutter/material.dart';

class NumButton extends StatelessWidget {
  const NumButton({super.key, required this.onPressed, required this.value});
  final void Function(String) onPressed;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          onPressed: () {
            onPressed(value);
          },
          child: Text(value),
        ),
      ),
    );
  }
}
