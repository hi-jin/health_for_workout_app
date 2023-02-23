DateTime getDateNDaysBefore(DateTime date, int n) {
  return DateTime(date.year, date.month, date.day - n);
}

String convertWeekdayToString(int weekday) {
  assert(weekday >= 1 && weekday <= 7);
  return ['월', '화', '수', '목', '금', '토', '일'][weekday - 1];
}
