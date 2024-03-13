// ignore_for_file: avoid_single_cascade_in_expression_statements, prefer_const_constructors

import 'dart:convert';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:mutliple_calendar_management/calendarView.dart';
import 'package:http/http.dart' as http;
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart' as calendar;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

DateTime now = DateTime.now();

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Future<List<CalendarEventData>> fetchGoogleCalendarEvents() async {
    final String url = 'https://www.googleapis.com/calendar/v3/calendars/'
        '337aa3a10ce4de3326dc8e153e6e8c88232d1c328e2d9971e040232ddb6e33c3'
        '@group.calendar.google.com/events?key=AIzaSyDQNOnZbiWMPGnwe2VKDA6mUIIpNPdoJt0';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<CalendarEventData> events = parseGoogleCalendarResponse(response.body);
      return events;
    } else {
      throw Exception('Failed to fetch events: ${response.statusCode}');
    }
  }

  List<CalendarEventData> parseGoogleCalendarResponse(String responseBody) {
    final Map<String, dynamic> data = json.decode(responseBody);
    final List<dynamic> items = data['items'];

    List<CalendarEventData> events = items.map((item) {
      final String summary = item['summary'];
      final String? description = item['description'];
      final String startTimeStr = item['start']['date'];
      final String endTimeStr = item['end']['date'];

      final DateTime startTime = DateTime.parse(startTimeStr);
      final DateTime endTime = DateTime.parse(endTimeStr);

      return CalendarEventData(
        date: startTime,
        title: summary,
        description: description ?? '',
        startTime: startTime,
        endTime: endTime,
      );
    }).toList();

    return events;
  }

  List<CalendarEventData> events = [];
  @override
  initState() {
    fetchEvents();
    // Now you have a list of CalendarEventData objects
    super.initState();
  }

  fetchEvents() async {
    events = await fetchGoogleCalendarEvents();
    setState(() {});
  }

 Future<void> addEventToGoogleCalendar() async {
    // Load Google credentials
    final credentials = ServiceAccountCredentials.fromJson({
      "private_key_id": "YOUR_PRIVATE_KEY_ID",
      "private_key": "YOUR_PRIVATE_KEY",
      "client_email": "YOUR_CLIENT_EMAIL",
      "client_id": "YOUR_CLIENT_ID",
      "type": "service_account",
    });

    // Authenticate
    final client = await clientViaServiceAccount(credentials, [
      calendar.CalendarApi.calendarEventsScope,
    ]);

    // Create a new event
    final calendarApi = calendar.CalendarApi(client);
    final event = calendar.Event(summary: "",start: calendar.EventDateTime(dateTime: DateTime.now()));
      // ..summary = 'Test Event'
      // ..description = 'This is a test event'
      // ..start = calendar.EventDateTime.dateTime(DateTime.now())
      // ..end = calendar.EventDateTime.dateTime(DateTime.now().add(Duration(hours: 1)));

    // Add the event to the calendar
    await calendarApi.events.insert(event, 'primary');
  }


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var controller = EventController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("d"),
        ),
        body: CalendarControllerProvider(
            controller: controller..addAll(events),
            child: MonthView(onCellTap: (a, b) {
              controller.addAll([
                CalendarEventData(
                  date: now.add(Duration(days: 8)),
                  startTime: DateTime(now.year, now.month, now.day + 7, 18, 30),
                  endTime: DateTime(now.year, now.month, now.day + 7, 22),
                  title: "Sprint Meeting.",
                  description: "Last day of project submission for last year.",
                ),
              ]);
            })) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
