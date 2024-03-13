// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:calendar_view/calendar_view.dart';
// DateTime get now => DateTime.now();

// class CalendarView extends StatelessWidget {

//   final List<CalendarEventData> _events = [
//   CalendarEventData(
//     date: now,
//     title: "Project meeting",
//     description: "Today is project meeting.",
//     startTime: DateTime(now.year, now.month, now.day, 18, 30),
//     endTime: DateTime(now.year, now.month, now.day, 22),
//   ),
//   CalendarEventData(
//     date: now.add(Duration(days: 1)),
//     startTime: DateTime(now.year, now.month, now.day, 18),
//     endTime: DateTime(now.year, now.month, now.day, 19),
//     title: "Wedding anniversary",
//     description: "Attend uncle's wedding anniversary.",
//   ),
//   CalendarEventData(
//     date: now,
//     startTime: DateTime(now.year, now.month, now.day, 14),
//     endTime: DateTime(now.year, now.month, now.day, 17),
//     title: "Football Tournament",
//     description: "Go to football tournament.",
//   ),
//   CalendarEventData(
//     date: now.add(Duration(days: 3)),
//     startTime: DateTime(now.add(Duration(days: 3)).year,
//         now.add(Duration(days: 3)).month, now.add(Duration(days: 3)).day, 10),
//     endTime: DateTime(now.add(Duration(days: 3)).year,
//         now.add(Duration(days: 3)).month, now.add(Duration(days: 3)).day, 14),
//     title: "Sprint Meeting.",
//     description: "Last day of project submission for last year.",
//   ),
//   CalendarEventData(
//     date: now.subtract(Duration(days: 2)),
//     startTime: DateTime(
//         now.subtract(Duration(days: 2)).year,
//         now.subtract(Duration(days: 2)).month,
//         now.subtract(Duration(days: 2)).day,
//         14),
//     endTime: DateTime(
//         now.subtract(Duration(days: 2)).year,
//         now.subtract(Duration(days: 2)).month,
//         now.subtract(Duration(days: 2)).day,
//         16),
//     title: "Team Meeting",
//     description: "Team Meeting",
//   ),
//   CalendarEventData(
//     date: now.subtract(Duration(days: 2)),
//     startTime: DateTime(
//         now.subtract(Duration(days: 2)).year,
//         now.subtract(Duration(days: 2)).month,
//         now.subtract(Duration(days: 2)).day,
//         10),
//     endTime: DateTime(
//         now.subtract(Duration(days: 2)).year,
//         now.subtract(Duration(days: 2)).month,
//         now.subtract(Duration(days: 2)).day,
//         12),
//     title: "Chemistry Viva",
//     description: "Today is Joe's birthday.",
//   ),
// ];

//    CalendarView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Calendar Page Demo',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(),
//         // scrollBehavior: const ScrollBehavior().copyWith(
//         //   dragDevices: {
//         //     PointerDeviceKind.trackpad,
//         //     PointerDeviceKind.mouse,
//         //     PointerDeviceKind.touch,
//         //   },
//         // ),
//         home: Container(),
//     );
//   }
// }