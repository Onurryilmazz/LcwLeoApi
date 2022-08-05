// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'graph_class.dart';

class DrawGraphNow extends StatelessWidget {
  const DrawGraphNow({
    Key? key,
    required this.CharDataNow, required this.Property, required this.GraphType,
  }) : super(key: key);

  final List<ChartDataNow> CharDataNow;
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
        title:ChartTitle(
          text: "${Property} - ${GraphType} ",
          backgroundColor: Colors.blue[50],
          textStyle: const TextStyle(color: Colors.orange, fontStyle: FontStyle.italic ),          
          ),
        primaryXAxis: CategoryAxis(labelRotation: 90,axisLabelFormatter:(AxisLabelRenderDetails args){
          late String text;
          text = "${DateTime.parse(args.text).day} / ${DateTime.parse(args.text).month} / ${DateTime.parse(args.text).year} - ${DateTime.parse(args.text).hour} : ${DateTime.parse(args.text).minute} ";
          return ChartAxisLabel(text,null);
        }),
        primaryYAxis: NumericAxis(),
        series: <LineSeries<ChartDataNow,String>>[
          LineSeries(
            name: Property,
            dataSource: CharDataNow, 
            xValueMapper: (ChartDataNow data, _) => data.dateTime, 
            yValueMapper: (ChartDataNow data, _) => data.count,
            enableTooltip: true,
            
           
      )]
      ,
      ),
    );
  }
}


class DrawGraphDaySum extends StatelessWidget {
  const DrawGraphDaySum({
    Key? key,
    required this.CharDataDay, required this.Property, required this.GraphType,
  }) : super(key: key);

  final List<ChartDataDay> CharDataDay;
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
        zoomPanBehavior: ZoomPanBehavior(enableDoubleTapZooming: false,),
        primaryXAxis: CategoryAxis(labelRotation: 90, axisLabelFormatter:(AxisLabelRenderDetails args){
          late String text;
          text = "${DateTime.parse(args.text).day} / ${DateTime.parse(args.text).month} / ${DateTime.parse(args.text).year}";
          return ChartAxisLabel(text,null);
        }, ),
        primaryYAxis: NumericAxis(),
        series: <LineSeries<ChartDataDay,DateTime>>[
          LineSeries(
            name: Property,
            dataSource: CharDataDay, 
            xValueMapper: (ChartDataDay data, _) => data.day, 
            yValueMapper: (ChartDataDay data, _) => data.count,
            enableTooltip: true
               
      )]
      ,
      ),
    );
  }
}

class DrawGraphDaySumMonth extends StatelessWidget {
  const DrawGraphDaySumMonth({
    Key? key,
    required this.CharDataMonth, required this.Property, required this.GraphType,
  }) : super(key: key);

  final List<ChartDataMonth> CharDataMonth;
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
        series: <LineSeries<ChartDataMonth,String>>[
          LineSeries(
            name: Property,
            dataSource: CharDataMonth, 
            xValueMapper: (ChartDataMonth data, _) => data.month, 
            yValueMapper: (ChartDataMonth data, _) => data.count,
            enableTooltip: true,
            markerSettings: const MarkerSettings(isVisible: true)   
      )]
      ,
      ),
    );
  }
}