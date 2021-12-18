import 'package:flutter/material.dart';

class RecentsProjects extends StatefulWidget {
  RecentsProjects({Key? key}) : super(key: key);

  @override
  _RecentsProjectsState createState() => _RecentsProjectsState();
}

class _RecentsProjectsState extends State<RecentsProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mes Projets récents"),
      ),
    );
  }
}
