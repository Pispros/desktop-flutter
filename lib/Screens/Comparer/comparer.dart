import 'package:flutter/material.dart';

class ComparisonScreen extends StatefulWidget {
  ComparisonScreen({Key? key}) : super(key: key);

  @override
  _ComparisonScreenState createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Comparer"),
      ),
    );
  }
}
