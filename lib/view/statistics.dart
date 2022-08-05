import 'dart:async';

import 'package:flutter/material.dart';
import 'package:statistics_project/models/statistic_model.dart';
import 'package:statistics_project/state/data/create_data.dart';
import 'package:statistics_project/state/graph_class.dart';

import '../controller/controller.dart';
import '../languages/languages.dart';
import '../state/graph.dart';

class StatisticsAnalysis extends StatefulWidget {
  const StatisticsAnalysis({Key? key}) : super(key: key);

  @override
  State<StatisticsAnalysis> createState() => _StatisticsAnalysisState();
}

class _StatisticsAnalysisState extends State<StatisticsAnalysis> {

  late final List<Statistics> fakeStatisticsData;
  late Widget? _Graph = const _WelcomeWidget();
  late List<ChartDataNow> CharDataNow = [];
  late List<ChartDataDay> CharDataDay = [];
  late List<ChartDataMonth> CharDataMonth = [];
  String property = ProjectText().DefaultProperty;
  String property2 = ProjectText().DefaultProperty2;
  String dropDownItem = ProjectText().DefaultDropDownText;


  @override
  void initState() {
    fakeStatisticsData = CreateData().CreateDataValue();
    Timer(const Duration(seconds:2),(){
          setState(() {
            CharDataNow = CreateChartDataNow(fakeStatisticsData,property,property2);
            _Graph = DrawGraphNow(CharDataNow: CharDataNow,Property: property,GraphType:'Anlık');
          });
    });
    super.initState();
  }


  void _changeGraph(String ButtonName){
        setState(() {
          if (ButtonName == ProjectButtonName().DayButton) {
            CharDataDay = CreateChartDataDay(fakeStatisticsData,property,property2);
            _Graph = DrawGraphDaySum(CharDataDay: CharDataDay,Property:property,GraphType : 'Günlük' );
          }
          else if (ButtonName == ProjectButtonName().NowButton){
            CharDataNow = CreateChartDataNow(fakeStatisticsData,property,property2);
            _Graph = DrawGraphNow(CharDataNow: CharDataNow,Property:property,GraphType : 'Anlık' );
          }
          else if(ButtonName == ProjectButtonName().MonthButton){
            CharDataMonth = CreateChartDataMonth(fakeStatisticsData,property,property2);
            _Graph = DrawGraphDaySumMonth(CharDataMonth: CharDataMonth,Property:property,GraphType : 'Aylık' );
          }
        });
  }

  void _changeGraphProperty(String DropDownItem){
        setState(() {
          property = DropDownProperty[DropDownItem]['propertyFather'];
          property2 = DropDownProperty[DropDownItem]['propertyChild'];
          CharDataNow = CreateChartDataNow(fakeStatisticsData,property,property2);
          _Graph = DrawGraphNow(CharDataNow: CharDataNow,Property: property,GraphType: 'Anlık',);
        });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(ProjectText().AppBarTitle),centerTitle: true,),
      body: Column(
        children: [
          Expanded(child: DropDownList()),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 10,left:10,right: 10),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: _Graph?? Text(ProjectText().GraphErrorMessage) 
                ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _grafphbutton("Anlık Grafik","Anlık"),
                _grafphbutton("Günlük Grafik","Day"),
                _grafphbutton("Aylık Grafik","Month"),
              ],
            ),
          )
        ],
      ),
    );
  }


  DropdownButton<String> DropDownList() {
    return DropdownButton(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            dropdownColor: Colors.blue[50],
            value: dropDownItem,
            icon: const Icon(Icons.keyboard_arrow_down),   
            items: DrowDownitems.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: const Color.fromARGB(255, 40, 14, 106),
                ),),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropDownItem = newValue!;
                _changeGraphProperty(dropDownItem);
              });
              
            },
          );
  }

  Padding _grafphbutton(String ButtonText, String ButtonOperation) => Padding(
    padding: const EdgeInsets.all(5.0),
    child: ElevatedButton(
      style : ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 16, 139, 240),
        shape:  RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(30.0),
        ),
        ),
      onPressed:() => _changeGraph(ButtonOperation) , 
      child: Text(ButtonText)),
  );

}


class _WelcomeWidget extends StatelessWidget {
  const _WelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/png/logo3.png')
      );
  }
}