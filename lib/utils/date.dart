import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:univagenda/keys/string_key.dart';
import 'package:univagenda/utils/functions.dart';
import 'package:univagenda/utils/translations.dart';

class Date {
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static DateTime dateFromDateTime(DateTime dt) {
    return DateTime(dt.year, dt.month, dt.day);
  }

  static DateTime setTimeFromOther(DateTime date, DateTime time) {
    return changeTime(date, time.hour, time.minute, time.second);
  }

  static DateTime changeTime(
    DateTime dt,
    int hour,
    int minute, [
    int second = 0,
  ]) {
    return DateTime(dt.year, dt.month, dt.day, hour, minute, second);
  }

  static String dateFromNow(DateTime date, [bool shortDate = false]) {
    DateTime today = DateTime.now();

    if (isSameDay(today, date)) {
      return i18n.text(StrKey.TODAY);
    } else if (isSameDay(today.add(Duration(days: 1)), date)) {
      return i18n.text(StrKey.TOMORROW);
    }

    DateFormat dateFormat;

    if (today.year == date.year) {
      if (shortDate) {
        dateFormat = DateFormat.MMMEd();
      } else {
        dateFormat = DateFormat.MMMMEEEEd();
      }
    } else {
      if (shortDate) {
        dateFormat = DateFormat.yMMMEd();
      } else {
        dateFormat = DateFormat.yMMMMEEEEd();
      }
    }

    return capitalize(dateFormat.format(date));
  }

  static String extractTime(DateTime? date) {
    if (date == null) return "";
    return DateFormat.Hm().format(date);
  }

  static String extractDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat.yMMMMd().format(date);
  }

  static int dateToInt(DateTime dt) {
    int year = dt.year;
    String month = dt.month.toString();
    if (month.length == 1) month = "0$month";

    String day = dt.day.toString();
    if (day.length == 1) day = "0$day";

    return int.parse("$year$month$day");
  }

  static DateTime intToDate(int dateInt) {
    String dateValue = dateInt.toString();

    int year = int.parse(dateValue.substring(0, 4));
    int month = int.parse(dateValue.substring(4, 6));
    int day = int.parse(dateValue.substring(6, 8));

    return DateTime(year, month, day);
  }

  static int calcDaysToEndDate(DateTime startDate, int numberWeeks) {
    return DateTime.daysPerWeek * numberWeeks;
  }

  static TimeOfDay calculateDuration(DateTime startDate, DateTime endDate) {
    var diff =
        endDate.millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

    var hours = (diff / 3.6e6).floor();
    var minutes = ((diff % 3.6e6) / 6e4).floor();

    return TimeOfDay(hour: hours, minute: minutes);
  }
}
