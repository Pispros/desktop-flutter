import 'package:demo_app/constants/environnement.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:charts_painter/chart.dart';

Widget ResultsTab(BuildContext context) {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  return Container(
      width: appViewPort(context).width * 80 / 100,
      height: appViewPort(context).height,
      child: Wrap(
        spacing: 100,
        children: [
          Container(
            child: PieChart(dataMap: dataMap),
            width: 500,
            height: 500,
          ),
          Container(
            width: 500.0,
            height: 500.0,
            child: Chart(
              state: ChartState<void>(
                ChartData.fromList(
                  [1, 3, 4, 2, 7, 6, 2, 5, 4]
                      .map((e) => BarValue<void>(e.toDouble()))
                      .toList(),
                  axisMax: 8,
                ),
                itemOptions: BarItemOptions(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  radius: BorderRadius.vertical(top: Radius.circular(12.0)),
                  color: Theme.of(context).accentColor,
                ),
                backgroundDecorations: [
                  GridDecoration(
                    verticalAxisStep: 1,
                    horizontalAxisStep: 4,
                    gridColor: Theme.of(context).dividerColor,
                  ),
                  SparkLineDecoration(
                    lineColor: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
}
