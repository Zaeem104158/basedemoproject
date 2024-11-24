import 'package:baseproj/common_widget/scaffold_appandbottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/utility/date_time.dart';
import '../controller/calendar_controller.dart';

class CalendarScreen extends GetView<CalendarController> {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAppAndBottomBar(
      showDrawer: false,
      appbarTitle: "Calendar",
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /* 
         if (result != null && result.containsKey('date')) {
                 
                }
         */

          Map<String, String>? result =
              await DateTimeConverter.pickAndConvertDate(
            context: context,
            // countryCode: "PK", // Example: Pakistan
            format: "yyyy-MM-dd", // Example format // "MMM dd, yyyy"
          );

          if (result != null && result.containsKey('date')) {
            Get.defaultDialog(
              title: "Add Event",
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller.eventTitleTextEditingController,
                  ),
                  TextField(
                    controller: controller.eventSubTitleTextEditingController,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final date = result['date']!;
                        // If the date exists, update the list of events
                        if (controller.events.containsKey(date)) {
                          controller.events[date] = [
                            ...controller.events[date]!,
                            Event(
                                title: controller
                                    .eventTitleTextEditingController.text,
                                subtitle: controller
                                    .eventSubTitleTextEditingController.text),
                          ];
                          Get.back();
                        } else {
                          // Add a new date and its events
                          controller.events[date] = [
                            Event(
                                title: controller
                                    .eventTitleTextEditingController.text,
                                subtitle: controller
                                    .eventSubTitleTextEditingController.text),
                          ];
                          Get.back();
                        }
                      },
                      child: const Text("Submit"))
                ],
              ),
            );
          }
        },
        child: const Icon(Icons.event),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CalendarEventsPage(
          controller: controller,
        ),
      ),
    );
  }
}

class CalendarEventsPage extends StatelessWidget {
  final CalendarController controller;

  const CalendarEventsPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          // Calendar Widget
          TableCalendar(
            firstDay: DateTime(2024, 1, 1),
            lastDay: DateTime(20100, 12, 31),
            focusedDay: DateTime.now(),
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
                headerMargin: EdgeInsets.only(left: 8)),
            calendarStyle: const CalendarStyle(
              // Enable dot markers
              markerDecoration: BoxDecoration(
                color: Color(0xFFfa3966),
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                  color: Color(0xFFfa3966),
                  //shape: BoxShape.circle,
                  borderRadius: BorderRadius.all(Radius.circular(15))),

              markersMaxCount: 3,
              // outsideDaysVisible: false,
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.red),
            ),
            eventLoader: (day) {
              return controller.events.entries
                  .where((entry) {
                    final date = DateTime.parse(entry.key);
                    return date.year == day.year &&
                        date.month == day.month &&
                        date.day == day.day;
                  })
                  .expand((entry) =>
                      entry.value) // Return the list of events for that date
                  .toList();
            },
          ),

          // Event List
          Expanded(
            child: ListView.builder(
              itemCount: controller.events.length,
              //shrinkWrap: true,
              itemBuilder: (context, index) {
                final eventsDate = controller.events.keys.toList()[index];
                final events = controller.events[eventsDate]!;
                List tileColors = [
                  const Color(0xFFfff2ec),
                  const Color(0xFFd4f4ff),
                  const Color(0xFFffd4d5),
                ];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...events.asMap().entries.map((entry) {
                      final eventIndex = entry.key;
                      final event = entry.value;

                      final tileColor =
                          tileColors[(index + eventIndex) % tileColors.length];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          tileColor: tileColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xFFfa3966),
                            radius: 20,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  eventsDate.split("-")[2],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat.MMMM()
                                      .format(DateTime.parse(eventsDate))
                                      .substring(0, 3),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          title: Text(event.title),
                          subtitle: event.subtitle == null
                              ? null
                              : Text(event.subtitle!),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

















/* 
class BasicUsage extends StatefulWidget {
  const BasicUsage({super.key});

  @override
  State<BasicUsage> createState() => _BasicUsageState();
}

class _BasicUsageState extends State<BasicUsage> {
  final _noScreenshot = NoScreenshot.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('No Screenshot Basic Usage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: disableScreenshot,
                child: const Text('Disable Screenshot'),
              ),
              ElevatedButton(
                onPressed: enableScreenshot,
                child: const Text('Enable Screenshot'),
              ),
              ElevatedButton(
                onPressed: toggleScreenshot,
                child: const Text('Toggle Screenshot'),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  void toggleScreenshot() async {
    bool result = await _noScreenshot.toggleScreenshot();
    debugPrint('Toggle Screenshot: $result');
  }

  void enableScreenshot() async {
    bool result = await _noScreenshot.screenshotOn();
    debugPrint('Enable Screenshot: $result');
  }


  void disableScreenshot() async {
    bool result = await _noScreenshot.screenshotOff();
    debugPrint('Screenshot Off: $result');
  }
}
*/