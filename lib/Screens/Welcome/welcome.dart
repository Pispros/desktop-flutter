import 'dart:ui';

import 'package:demo_app/Screens/Comparer/comparer.dart';
import 'package:demo_app/Screens/Projets/projects.dart';
import 'package:demo_app/Screens/Projets/recent.projects.dart';
import 'package:demo_app/Screens/Results/results.dart';
import 'package:demo_app/constants/colors.dart';
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
  bool choosenOptionStateTap = false;
  Color choosenOptionColor = appMainColor;
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        child: Row(
          children: [
            // Left SideBar
            Container(
              width: appViewPort(context).width * 20 / 100,
              height: appViewPort(context).height,
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
        "icon": CupertinoIcons.book
      },
      {
        "index": 1,
        "name": "Comparer",
        "widget": ComparisonScreen(),
        "icon": Icons.trending_up
      },
      {"index": 2, "name": "Déconnexion", "icon": Icons.logout},
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
    return Material(
      color: currentIndex == element["index"]
          ? choosenOptionColor
          : Colors.grey.shade200,
      child: InkWell(
        //hoverColor: appMainColor,
        splashColor: appMainColor,
        onTap: () {
          setState(() {
            currentIndex = element["index"];
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
              Icon(
                element["icon"],
                color: currentIndex == element["index"]
                    ? Colors.white
                    : Colors.black,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                element["name"],
                style: TextStyle(
                  fontSize: 18,
                  color: currentIndex == element["index"]
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: currentIndex == element["index"]
                        ? Colors.white
                        : Colors.black,
                  )
                ],
              )),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
