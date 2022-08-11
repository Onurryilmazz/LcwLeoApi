// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'graph_class.dart';

class DrawGraph extends StatelessWidget {
  const DrawGraph({
    Key? key,
    required this.ChartDataGraph, required this.Property, required this.GraphType,
  }) : super(key: key);

  final List<ChartData> ChartDataGraph;
  final String Property;
  final String GraphType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SfCartesianChart(
        tooltipBehavior: TooltipBehavior(
          enable: true,
          textStyle: const TextStyle(color: Colors.purple),
          duration: 0.1,
          borderColor: Colors.orange,
          borderWidth: 2, 
          color: Colors.blue[100]),
        title: ChartTitle(
          text: "${Property} - ${GraphType} ",
          backgroundColor: Colors.blue[50],
          textStyle: const TextStyle(color: Colors.orange, fontStyle: FontStyle.italic ),          
          ),
        zoomPanBehavior: ZoomPanBehavior(enableMouseWheelZooming : false),
        primaryXAxis: CategoryAxis(labelRotation: 90,),
        primaryYAxis: NumericAxis(),
        series: <LineSeries<ChartData,String>>[
          LineSeries(
            name: Property,
            dataSource: ChartDataGraph, 
            xValueMapper: (ChartData data, _) => data.date, 
            yValueMapper: (ChartData data, _) => data.count,
            enableTooltip: true,
            markerSettings: MarkerSettings(isVisible: ChartDataGraph.length < 10 ? true:false)   
      )]
      ,
      ),
    );
  }
}
