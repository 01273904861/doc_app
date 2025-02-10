import 'package:intl/intl.dart';

class SevenDaysOfweek {
  SevenDaysOfweek() {
    final DateTime time = DateTime.now();
    for (int i = 0; i < 7; i++) {
      //7 days
      final DateTime newDate = time.add(Duration(days: i)); //1 2 3 4 5 6 7

      final String dayName = DateFormat('EEE').format(newDate);
      final String dayNum = DateFormat('dd').format(newDate);
      getFullDateAndHours(newDate);

      dayList.add(Day(
          name: dayName,
          number: dayNum,
          fullDate: fullDateList,
          hours: hoursList));

      fullDateList = <String>[];
      hoursList = <String>[];
    }
  }
  List<String> fullDateList = <String>[];
  List<String> hoursList = <String>[];
  List<Day> dayList = <Day>[];

  void getFullDateAndHours(DateTime newDate) {
    int startHour;
    if (newDate.day == DateTime.now().day &&
        newDate.month == DateTime.now().month &&
        DateTime.now().year == newDate.year) {
      startHour = newDate.hour + 2;
    } else {
      startHour = 14;
    }

    for (int i = startHour; i <= 20; i++) {
      final DateTime tempTime =
          DateTime(newDate.year, newDate.month, newDate.day, i);
      final String fullDate =
          DateFormat('yyyy-MM-dd HH:mm').format(tempTime); //2025-01-28 7:54
      fullDateList.add(fullDate);
      final String hour = DateFormat('hh:mm a').format(tempTime); //07:54 am
      hoursList.add(hour);
    }
  }
}

class Day {
  Day(
      {required this.name,
      required this.number,
      required this.fullDate,
      required this.hours});

  final String name;
  final String number;
  final List<String> hours;
  final List<String> fullDate;
}
