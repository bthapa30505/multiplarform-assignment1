import 'package:flutter/material.dart';

class ConversionResult extends StatelessWidget {
  final String result;

  const ConversionResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Text(
      result.toString(),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
