// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:statistics_project/models/statistic_model.dart';
import 'package:statistics_project/state/graph_class.dart';

import '../constant/constant.dart';
import '../controller/controller.dart';
import '../languages/languages.dart';
import '../state/graph.dart';

class StatisticsAnalysis extends StatefulWidget {
  const StatisticsAnalysis({Key? key}) : super(key: key);

  @override
  State<StatisticsAnalysis> createState() => _StatisticsAnalysisState();
}

class _StatisticsAnalysisState extends State<StatisticsAnalysis> {

  List<Statistics> StatisticsData = [];
  List<Statistics> Data = [];
  late Widget? _Graph = const _WelcomeWidget();
  late List<ChartData> CharDataNow = [];
  late List<ChartData> CharDataDay = [];
  late List<ChartData> CharDataMonth = [];
  String property = ProjectText().DefaultProperty;
  String property2 = ProjectText().DefaultProperty2;
  String dropDownItem = ProjectText().DefaultDropDownText;
  String timeInterval = DefaultTimeInterval;
  String graphType = DefaultGraphType;
  



  Future<void> fetchStudentItem() async {
  var response = await Dio().get("https://mocki.io/v1/be763439-3c7c-4c72-b0dd-5c3d0efd1c18");
  //var response = await Dio().get("https://192.168.68.106:44393/api/Mobile/Transfer/GetAllStatisticsFromMongo");
  var data = response.data.map((e) => Statistics.fromJson(e)).toList();
  for (var element in data) {
    Data.add(element);
  }
  }


  List<Statistics> FilterTimeInterval(String timeInterval){
    DateTime NowDate = DateTime.now();
    List<Statistics> StatisticsDataWithTimeInterval = [];

    if (timeInterval == DefaultTimeInterval){
      return Data;
    }

    for (var element in Data) {
      var elementDate = element.dateTime?? DateTime.now().toString();
      if (NowDate.difference(DateTime.parse(elementDate)).inDays < TimeInterval[timeInterval]["TimeInterval"]) {
        StatisticsDataWithTimeInterval.add(element);
      }
    }
    return StatisticsDataWithTimeInterval;
  }


  @override
  void initState() {
    fetchStudentItem();
    StatisticsData = Data;
    Timer(const Duration(seconds:2),(){
          setState(() {
            CharDataNow = CreateChartDataNow(StatisticsData,property,property2);
            _Graph = DrawGraph(ChartDataGraph: CharDataNow,Property: property,GraphType:'Anlık');
          });
    });
    super.initState();
  }


  void _changeGraph(String ButtonName){
        setState(() {
          if (ButtonName == ProjectButtonName().DayButton) {
            CharDataDay = CreateChartData(StatisticsData,'Day',property,property2);
            graphType = 'Günlük';
            _Graph = DrawGraph(ChartDataGraph: CharDataDay,Property:property,GraphType : graphType );
          }
          else if (ButtonName == ProjectButtonName().NowButton){
            CharDataNow = CreateChartDataNow(StatisticsData,property,property2);
            graphType = 'Anlık';
            _Graph = DrawGraph(ChartDataGraph: CharDataNow,Property:property,GraphType : graphType );
          }
          else if(ButtonName == ProjectButtonName().MonthButton){
            CharDataMonth = CreateChartData(StatisticsData,'Month',property,property2);
            graphType = 'Aylık';
            _Graph = DrawGraph(ChartDataGraph: CharDataMonth,Property:property,GraphType : graphType );
          }
        });
  }

  void _changeGraphProperty(String DropDownItem){
        setState(() {
          property = DropDownProperty[DropDownItem]['propertyFather'];
          property2 = DropDownProperty[DropDownItem]['propertyChild'];
          StatisticsData = FilterTimeInterval(timeInterval);
          CharDataNow = CreateChartDataNow( StatisticsData,property,property2);
          _Graph = DrawGraph(ChartDataGraph: CharDataNow,Property: property,GraphType: DefaultGraphType,);
        });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(ProjectText().AppBarTitle),centerTitle: true,
        actions: _TimeIntervalPopUpMenu
        ),
      body: Column(
        children: [
          Expanded(child: DropDownList()),
          Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.017,
                left:MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardBorderRadius)),
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

  List<Widget> get _TimeIntervalPopUpMenu {
    return <Widget>[PopupMenuButton(
        icon: const Icon(Icons.update_outlined),
        iconSize: projectIconSize,
        color: projectBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
               Radius.circular(menuBorderRadius),
          ),
        ),
        itemBuilder: 
        ((context) => [
          PopupMenuItem(value: 'allTime',child: Text(TimeInterval["AllTime"]),),
          PopupMenuItem(value: 'LastYear',child: Text(TimeInterval["LastYear"]["Name"])),
          PopupMenuItem(value: 'Last6Month', child: Text(TimeInterval["Last6Month"]["Name"])),
          PopupMenuItem(value: 'Last3Month',child: Text(TimeInterval["Last3Month"]["Name"])),
          PopupMenuItem(value: 'Last1Month',child: Text(TimeInterval["Last1Month"]["Name"])),
          PopupMenuItem(value: 'Last1Week',child: Text(TimeInterval["Last1Week"]["Name"]))
          ]),
          onSelected: _updateTimeInterval,)];
  }

  void _updateTimeInterval(String selectedTime) {
          setState(() {
            timeInterval = selectedTime;
            StatisticsData = FilterTimeInterval(timeInterval);
            CharDataNow = CreateChartDataNow(StatisticsData,property,property2);
             _Graph = DrawGraph(ChartDataGraph: CharDataNow,Property: property,GraphType: 'Anlık',);
          });
        }


  DropdownButton<String> DropDownList() {
    return DropdownButton(
            borderRadius: BorderRadius.all(Radius.circular(menuBorderRadius)),
            dropdownColor: projectBlueColor,
            value: dropDownItem,
            icon: const Icon(Icons.keyboard_arrow_down),   
            items: DrowDownitems.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: projectDarkBlueColor,
                ),),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropDownItem = newValue!;
                timeInterval = DefaultTimeInterval;
                _changeGraphProperty(dropDownItem);
              });
              
            },
          );
  }

  Padding _grafphbutton(String buttonText, String buttonOperation) => Padding(
    padding:  EdgeInsets.all(buttonPadding),
    child: ElevatedButton(
      style : ElevatedButton.styleFrom(
        primary: elevatedButtonColor,
        shape:  RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(buttonBorderRadius),
        ),
        ),
      onPressed:() => _changeGraph(buttonOperation) , 
      child: Text(buttonText)),
  );

}


class _WelcomeWidget extends StatelessWidget {
  const _WelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(LcwLogoPath)
      );
  }
}