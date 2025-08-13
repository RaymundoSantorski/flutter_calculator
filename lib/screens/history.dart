import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.history, required this.scheme});
  final List<String> history;
  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
