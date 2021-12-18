import 'dart:ui';

import 'package:demo_app/Screens/Projets/new.project.dart';
import 'package:demo_app/Screens/Projets/results.project.dart';
import 'package:demo_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatefulWidget {
  ProjectsScreen({Key? key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appMainColor,
          leading: Icon(
            CupertinoIcons.book,
            color: Colors.white,
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "MES PROJETS",
              ),
              Tab(
                text: "NOUVEAU PROJET",
              ),
              Tab(
                text: "MES RESULTATS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("Mes projets"),
            ),
            NewProject(context),
            ResultsTab(context)
          ],
        ),
      ),
    );
  }
}
