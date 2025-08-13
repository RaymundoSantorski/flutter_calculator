import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.history, required this.scheme});
  final List<String> history;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scheme.primary,
      appBar: AppBar(
        title: Text(
          'Calculator History',
          style: TextStyle(
            color: scheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: scheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, i) {
            return Text(
              '• ${history[i]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: scheme.inversePrimary,
              ),
            );
          },
        ),
      ),
    );
  }
}
