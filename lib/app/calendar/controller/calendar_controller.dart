import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusday = DateTime.now().obs;
  DateTime? selectedDay;
  RxMap<String, List<Event>> events = <String, List<Event>>{}.obs;
  TextEditingController eventTitleTextEditingController =
      TextEditingController();
  TextEditingController eventSubTitleTextEditingController =
      TextEditingController();
  @override
  void onInit() {
    selectedDay = focusday.value;
    super.onInit();
  }

  void onDaySelected(DateTime onSelectedDay, DateTime onFocusday) {
    if (isSameDay(onSelectedDay, onFocusday)) {
      selectedDay = onSelectedDay;
      focusday.value = onFocusday;
    }
  }
}

class Event {
  final String title;
  final String? subtitle;
  Event({required this.title, this.subtitle});
}
