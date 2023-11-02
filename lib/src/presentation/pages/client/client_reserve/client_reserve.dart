import 'package:flutter/material.dart';
import 'package:henry_meds_challenge/src/domain/entities/selected_day_time_entity.dart';
import 'package:henry_meds_challenge/src/presentation/notifiers/client/client_notifier.dart';
import 'package:henry_meds_challenge/src/presentation/pages/shared_widgets/custom_submit_button.dart';
import 'package:hexcolor/hexcolor.dart';

class ClientReserve extends StatefulWidget {
  const ClientReserve({super.key, required this.clientNotifier});

  final ClientNotifier clientNotifier;

  @override
  State<ClientReserve> createState() => _ClientReserveState();
}

class _ClientReserveState extends State<ClientReserve> {
  SelectedDayTimeEntity selectedDayTime = SelectedDayTimeEntity(
    id: 1,
    day: 'Nov 5, 2023',
    time: '8:00 AM',
  );

  //TODO: turn this into json data and return with entity (model) built
  final mockData = [
    {
      'id': 1,
      'day': 'Nov 5, 2023',
      'times': [
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
      ],
    },
    {
      'id': 2,
      'day': 'Nov 6, 2023',
      'times': [
        '8:00 AM',
        '9:30 AM',
        '10:00 AM',
      ],
    },
    {
      'id': 3,
      'day': 'Nov 7, 2023',
      'times': [
        '10:00 AM',
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
              const SizedBox(
                height: 50,
              ),
              Wrap(
                spacing: 16,
                runAlignment: WrapAlignment.center,
                runSpacing: 16,
                children: List.generate(
                  mockData.length,
                  (index) {
                    dynamic item = mockData[index];
                    String day = item['day'];
                    int id = item['id'];
                    return Column(
                      children: [
                        const Divider(),
                        Text(
                          day,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Divider(),
                        Wrap(
                          spacing: 16,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 16,
                          children: List.generate(
                            item['times'].length,
                            (index) {
                              String time = item['times'][index];
                              bool isSelected =
                                  selectedDayTime.id == item['id'] &&
                                      selectedDayTime.time == time;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedDayTime = SelectedDayTimeEntity(
                                      id: id,
                                      day: day,
                                      time: time,
                                    );
                                  });
                                },
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: isSelected
                                        ? HexColor('#00836c')
                                        : Colors.grey.withOpacity(0.5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    time,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        CustomSubmitButton(onTap: () {
          //TODO: update selected times to the backend
          widget.clientNotifier
              .addSelectedDayTime(selectedDayTime: selectedDayTime);
        }),
        const SizedBox(
          height: 21,
        ),
      ],
    );
  }
}
