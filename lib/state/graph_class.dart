class ChartDataNow {
  ChartDataNow(this.count, this.dateTime);
  final int count;
  final String dateTime;
}

class ChartDataDay {
  ChartDataDay(this.day, this.count);
  final int count;
  final DateTime day;
}

class ChartDataMonth {
  ChartDataMonth(this.month, this.count);
  final int count;
  final String month;
}