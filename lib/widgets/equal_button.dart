import 'package:flutter/material.dart';

class EqualButton extends StatelessWidget {
  const EqualButton({super.key, required this.onPressed, required this.color});
  final void Function(BuildContext) onPressed;
  final Color color;

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
            backgroundColor: WidgetStatePropertyAll(color),
          ),
          onPressed: () => onPressed(context),
          child: Text(
            '=',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
