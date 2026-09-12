import 'package:flutter/material.dart';
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({required this.title, this.message = 'Foundation placeholder', super.key});
  final String title; final String message;
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Text(title, style: Theme.of(context).textTheme.headlineMedium), const SizedBox(height: 8), Text(message)])),
  );
}
