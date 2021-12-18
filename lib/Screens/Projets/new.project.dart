import 'dart:ui';

import 'package:demo_app/constants/environnement.dart';
import 'package:flutter/material.dart';

Widget NewProject(BuildContext context) {
  return Container(
    height: appViewPort(context).height,
    width: appViewPort(context).width * 80 / 100,
    child: Column(
      children: [
        // Scrollable Variables List
        Container(
          height: appViewPort(context).height * 73.9 / 100,
          width: appViewPort(context).width * 80 / 100,
          margin: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: ListOfVariables(context),
            ),
          ),
        ),
        // Options List
        Container(
          color: Colors.black26,
          height: appViewPort(context).height * 10 / 100,
          width: appViewPort(context).width * 80 / 100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sauvegarder',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(fixedSize: Size(250, 50)),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Visualiser',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(fixedSize: Size(250, 50)),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

List variables = ["PNP", "NPP", "NPNP", "PP"];

List<Widget> ListOfVariables(BuildContext context) {
  List<Widget> list = [];
  for (var i = 0; i < variables.length; i++) {
    list.add(generateAVariableInputSet(context, variables[i]));
  }
  return list;
}

Widget generateAVariableInputSet(BuildContext context, dynamic varName) {
  return Container(
    margin: const EdgeInsets.only(top: 3),
    height: 50,
    width: appViewPort(context).width * 80 / 100,
    child: Row(
      children: [
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(left: 5),
          padding: const EdgeInsets.only(top: 8, left: 10),
          height: 50,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: Text(
            varName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        )),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: TextField(
            decoration: InputDecoration(
                labelStyle: TextStyle(fontSize: 20),
                border: InputBorder.none,
                hintText: "Saisir une valeur"),
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    ),
  );
}