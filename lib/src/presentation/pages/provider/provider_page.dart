import 'package:flutter/material.dart';
import 'package:henry_meds_challenge/src/presentation/pages/shared_widgets/custom_app_bar.dart';
import 'package:henry_meds_challenge/src/presentation/pages/shared_widgets/custom_submit_button.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  late final TextEditingController startTimeController;

  @override
  void initState() {
    super.initState();
    startTimeController = TextEditingController();
  }

  //TODO: these are here because of time restraints, comes from backend
  List<String> addedTimes = [];
  String selectedTime = '8:00 AM';
  String selectedEndTime = '3:00 PM';
  List<String> timeOptions = [
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
  ];

  void snackBar(
      {required BuildContext context,
      bool isSuccess = false,
      bool isEmpty = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: isSuccess
            ? const Text(
                'Times Successfully Setup',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )
            : isEmpty
                ? const Text('Please add a day and time')
                : const Text('Time out of range'),
        duration: const Duration(seconds: 3),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Provider Page'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //NOTE: I would split these into separate widgets if I had more time
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Select your available times',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TableCalendar(
                    firstDay: DateTime.utc(2023, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                  ),
                  Center(
                      child: Text(
                          'Selected Day: ${DateFormat('MMMM d, y').format(_selectedDay)}')),
                  const Divider(),
                  const Center(
                    child: Text(
                      'Select your start time',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Column(
                    children: [
                      DropdownButton<String>(
                        value: selectedTime,
                        items: timeOptions.map((String time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Text(time),
                          );
                        }).toList(),
                        onChanged: (value) {
                          int startTimeIndex =
                              timeOptions.indexOf(value ?? selectedTime);
                          int endTimeIndex =
                              timeOptions.indexOf(selectedEndTime);
                          if (startTimeIndex >= endTimeIndex) {
                            snackBar(context: context);
                          } else {
                            setState(() {
                              selectedTime = value ?? selectedTime;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  const Center(
                    child: Text(
                      'Select your end time',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Column(
                    children: [
                      DropdownButton<String>(
                        value: selectedEndTime,
                        items: timeOptions.map((String time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Text(time),
                          );
                        }).toList(),
                        onChanged: (value) {
                          int startTimeIndex =
                              timeOptions.indexOf(selectedTime);
                          int endTimeIndex =
                              timeOptions.indexOf(value ?? selectedEndTime);
                          if (startTimeIndex >= endTimeIndex) {
                            snackBar(context: context);
                          } else {
                            setState(
                              () {
                                selectedEndTime = value ?? selectedEndTime;
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          String dateTime =
                              'Day: ${DateFormat('MMMM d, y').format(_selectedDay)}, Start Time: $selectedTime, End Time: $selectedEndTime';
                          if (!addedTimes.contains(dateTime)) {
                            addedTimes.add(dateTime);
                          }
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                          height: 50,
                          margin: const EdgeInsets.only(bottom: 13),
                          decoration: BoxDecoration(
                            color: HexColor('#00836c'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: 16,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 16,
                    children: List.generate(
                      addedTimes.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              addedTimes.removeAt(index);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        addedTimes[index],
                                      ),
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            CustomSubmitButton(onTap: () {
              //TODO: update content to backend
              if (addedTimes.isNotEmpty) {
                snackBar(context: context, isSuccess: true);
                Navigator.pop(context);
              } else {
                snackBar(context: context, isEmpty: true);
              }
            }),
          ],
        ),
      ),
    );
  }
}
