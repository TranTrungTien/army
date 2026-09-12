import 'package:flutter/material.dart';

class AppErrorBoundary extends StatefulWidget {
  const AppErrorBoundary({required this.child, super.key});
  final Widget child;
  @override
  State<AppErrorBoundary> createState() => _AppErrorBoundaryState();
}

class _AppErrorBoundaryState extends State<AppErrorBoundary> {
  @override
  void initState() {
    super.initState();
    ErrorWidget.builder = (details) => Material(
      color: const Color(0xFF111827),
      child: Center(
        child: Text(
          'Unexpected UI error\n${details.exceptionAsString()}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
