import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  ResultsScreen({Key? key}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Résultats"),
      ),
    );
  }
}
