import 'dart:math';
import 'dart:ui';
import 'package:demo_app/constants/environnement.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

TextEditingController pnpController = new TextEditingController();
TextEditingController nppController = new TextEditingController();
TextEditingController npnpController = new TextEditingController();
TextEditingController ppController = new TextEditingController();

Widget NewProject(BuildContext context) {
  return Container(
    height: appViewPort(context).height,
    width: appViewPort(context).width * 80 / 100,
    child: Column(
      children: [
        // Scrollable Variables List
        Container(
          height: appViewPort(context).height * 73 / 100,
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
                  onPressed: () {
                    var issp;
                    var transition;
                    var stabilite;

                    if (pnpController.text != "" &&
                        nppController.text != "" &&
                        npnpController.text != "" &&
                        ppController.text != "") {
                      transition = (double.parse(pnpController.text) /
                          (double.parse(pnpController.text) +
                              double.parse(nppController.text)));

                      stabilite = (double.parse(npnpController.text) /
                          (double.parse(npnpController.text) +
                              double.parse(ppController.text)));

                      issp = sqrt(transition * stabilite);

                      Map<String, double> dataMap = {
                        "PNP": double.parse(pnpController.text),
                        "NPP": double.parse(nppController.text),
                        "NPNP": double.parse(npnpController.text),
                        "PP": double.parse(ppController.text),
                      };
                      List<Widget> listValues = [];
                      List rawValues = [
                        {"name": 'Transition', "value": transition},
                        {"name": 'Stabilité', "value": stabilite},
                        {"name": 'ISSP', "value": issp}
                      ];
                      listValues.add(generateAVariableInputTabValue(context,
                          {"name": 'Transition', "value": transition}));
                      listValues.add(generateAVariableInputTabValue(
                          context, {"name": 'Stabilité', "value": stabilite}));
                      listValues.add(generateAVariableInputTabValue(
                          context, {"name": 'ISSP', "value": issp}));
                      var alert = AlertDialog(
                        title: Text(
                          'Résultats Calcul Dimension 3',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        content: Container(
                          width: appViewPort(context).width / 2,
                          child: Column(children: [
                            Column(
                              children: listValues,
                            ),
                            Container(
                              child: PieChart(
                                dataMap: dataMap,
                                legendOptions: LegendOptions(
                                  showLegendsInRow: false,
                                  legendPosition: LegendPosition.right,
                                  showLegends: true,
                                  legendShape: BoxShape.circle,
                                  legendTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              width: 400,
                              height: 400,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Fermer",
                                        style: TextStyle(fontSize: 22),
                                      )),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        createExcel(rawValues);
                                      },
                                      child: Text(
                                        "Exporter",
                                        style: TextStyle(fontSize: 22),
                                      )),
                                )
                              ],
                            )
                          ]),
                        ),
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          });
                    } else {
                      var alert = AlertDialog(
                        title: Text('Résultats Calcul Dimensions'),
                        content: Column(children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "Veuillez saisir des valeurs correctes",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 23),
                              ),
                              width: appViewPort(context).width / 2,
                              height: appViewPort(context).height / 2,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Fermer",
                                  style: TextStyle(fontSize: 22),
                                )),
                          )
                        ]),
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          });
                    }
                  },
                  child: Text(
                    'Calculer',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(fixedSize: Size(250, 50)),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

List variables = [
  {"name": "PNP", "controller": pnpController},
  {"name": "NPP", "controller": nppController},
  {"name": "NPNP", "controller": npnpController},
  {"name": "PP", "controller": ppController},
];

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
            varName["name"],
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
            controller: varName["controller"],
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

Widget generateAVariableInputTabValue(BuildContext context, dynamic varName) {
  return Container(
    margin: const EdgeInsets.only(top: 3),
    height: 50,
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
            varName["name"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        )),
        SizedBox(
          width: 5,
        ),
        Container(
          width: 250,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: Text(
            "${varName["value"]}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    ),
  );
}

Future<void> createExcel(List outputData) async {
  final xlsio.Workbook workbook = xlsio.Workbook();
  final xlsio.Worksheet sheet = workbook.worksheets[0];
  for (var i = 0; i < outputData.length; i++) {
    String? rowValue = (i + 1).toString();
    print(outputData[i]["value"]);
    sheet
        .getRangeByName("B" + rowValue)
        .setText(outputData[i]["value"].toString());
    sheet
        .getRangeByName("A" + rowValue)
        .setText(outputData[i]["name"].toString());
  }
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  if (kIsWeb) {
    AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', 'Output.xlsx')
      ..click();
  } else {
    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName =
        Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
