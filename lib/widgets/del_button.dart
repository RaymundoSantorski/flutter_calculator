import 'package:flutter/material.dart';

class DelButton extends StatelessWidget {
  const DelButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.label,
  });
  final Color backgroundColor;
  final void Function() onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
