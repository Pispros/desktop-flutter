import 'dart:ui';

import 'package:demo_app/Screens/Comparer/comparer.dart';
import 'package:demo_app/Screens/Projets/projects.dart';
import 'package:demo_app/Screens/Projets/recent.projects.dart';
import 'package:demo_app/Screens/Results/results.dart';
import 'package:demo_app/constants/environnement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget choosenOption = RecentsProjects();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            // Left SideBar
            Container(
              width: appViewPort(context).width * 20 / 100,
              height: appViewPort(context).height,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: SingleChildScrollView(
                child: Column(
                  children: toolsetOption(),
                ),
              ),
            ),
            // Right SideBar
            Container(
              width: appViewPort(context).width * 80 / 100,
              height: appViewPort(context).height,
              child: choosenOption,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> toolsetOption() {
    List listOptions = [
      {
        "index": 0,
        "name": "Projets",
        "widget": ProjectsScreen(),
        "icon": Icon(CupertinoIcons.book)
      },
      {
        "index": 1,
        "name": "Comparer",
        "widget": ComparisonScreen(),
        "icon": Icon(Icons.trending_up)
      },
      {"index": 2, "name": "Déconnexion", "icon": Icon(Icons.logout)},
    ];

    List<Widget> list = [];
    list.add(SizedBox(
      height: 100,
    ));
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Licence Afrique - 2",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    ));
    list.add(SizedBox(
      height: 50,
    ));
    for (var i = 0; i < listOptions.length; i++) {
      list.add(generateMenuOption(listOptions[i]));
    }
    return list;
  }

  Widget generateMenuOption(dynamic element) {
    return InkWell(
      hoverColor: Colors.blueAccent,
      onTap: () {
        setState(() {
          if (element["index"] == 2)
            Navigator.of(context).pushNamed("login");
          else
            choosenOption = element["widget"];
        });
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(top: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 15,
            ),
            element["icon"],
            SizedBox(
              width: 15,
            ),
            Text(
              element["name"],
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(CupertinoIcons.right_chevron)],
            )),
            SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    );
  }
}
