// ignore_for_file: non_constant_identifier_names

import '../models/statistic_model.dart';
import '../state/graph_class.dart';

List<ChartData> CreateChartDataNow(List<Statistics> statistics,String FatherFeature,[String childrenFeature = '']){

  List<ChartData> data = [];
  for (var element in statistics) {
    var elementJson = element.toJson();
    int count = FatherFeature!="Backlog"?
    childrenFeature==''?  elementJson[FatherFeature]:elementJson[FatherFeature][childrenFeature]:
    element.onaylananSiparis!.toplamOnaylananSiparisAdet! + element.toplamHazirlaniyor!.toplamHazirlaniyorAdet!;
    String date = "${DateTime.parse(element.dateTime??'').day} / ${DateTime.parse(element.dateTime??'').month} / ${DateTime.parse(element.dateTime??'').year} - ${DateTime.parse(element.dateTime??'').hour} : ${DateTime.parse(element.dateTime??'').minute} ";
    var charData = ChartData(count, date);
    data.add(charData);
  }
  return data;
}

List<ChartData> CreateChartData(List<Statistics> dataStatistic,String DataType,String FatherFeature, [String childrenFeature = '']){

  List<ChartData> CharData = [];

   var geciciData = DataType == "Day"? 
   ProcessCountWithTime(dataStatistic,FatherFeature,ChildrenFeature: childrenFeature ).sumDayProcess():
   ProcessCountWithTime(dataStatistic,FatherFeature,ChildrenFeature: childrenFeature ).sumMonthProcess();

    geciciData.forEach((key, value) {
      CharData.add(
        ChartData(value, key)
      );
    });

    return CharData;
}


class ProcessCountWithTime {
  ProcessCountWithTime(this.StatisticsData,this.FatherFeature,{this.ChildrenFeature});
  final List<Statistics> StatisticsData;
  String FatherFeature;
  String? ChildrenFeature; 
  late List<TimeInformationProcess> informationData = [];

  void InformationDate(){
    for (var element in StatisticsData) {

      var year = DateTime.parse(element.dateTime.toString()).year.toString();
      var month = DateTime.parse(element.dateTime.toString()).month.toString().length == 2 ? DateTime.parse(element.dateTime.toString()).month.toString(): "0${DateTime.parse(element.dateTime.toString()).month}" ;
      var day = DateTime.parse(element.dateTime.toString()).day.toString().length == 2 ? DateTime.parse(element.dateTime.toString()).day.toString(): "0${DateTime.parse(element.dateTime.toString()).day}" ;
      var hour = DateTime.parse(element.dateTime.toString()).hour.toString();
      var elementJson = element.toJson();
      int count = FatherFeature!="Backlog"?
      ChildrenFeature==''?  elementJson[FatherFeature]:elementJson[FatherFeature][ChildrenFeature]:
      element.onaylananSiparis!.toplamOnaylananSiparisAdet! + element.toplamHazirlaniyor!.toplamHazirlaniyorAdet!;

      informationData.add(
        TimeInformationProcess(
          element.guid??'',
          year, 
          month,
          day,
          hour,
          count,
          ),
      );
    }
  }

  
   Map sumDayProcess(){
      InformationDate();
      Map ProcessDataWithDay = {};
      for (var element in informationData) {
        String time = '${element.Year}-${element.month}-${element.day}';
        if (ProcessDataWithDay.containsKey(time)){
          ProcessDataWithDay[time] += element.count;
        }
        else{
          ProcessDataWithDay[time] = element.count;
        }
      }
      return ProcessDataWithDay;
   }

   Map sumMonthProcess(){
      InformationDate();
      var ProcessDataWithMonth = {};
      for (var element in informationData) {
        String time = '${element.Year}-${element.month}';
        if (ProcessDataWithMonth.containsKey(time)){
          ProcessDataWithMonth[time] += element.count;
        }
        else{
          ProcessDataWithMonth[time] = element.count;
        }
      }
      return ProcessDataWithMonth;
   }
}

class TimeInformationProcess{
  TimeInformationProcess(this.Id, this.Year, this.month,this.day,this.hours, this.count);
  final String Id;
  final String Year;
  final String month;
  final String day;
  final String hours;
  final int count;
}
