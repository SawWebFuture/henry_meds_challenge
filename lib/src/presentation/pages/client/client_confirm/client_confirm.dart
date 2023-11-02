import 'package:flutter/material.dart';
import 'package:henry_meds_challenge/src/domain/entities/selected_day_time_entity.dart';
import 'package:henry_meds_challenge/src/presentation/notifiers/client/client_notifier.dart';
import 'package:henry_meds_challenge/src/presentation/pages/shared_widgets/custom_submit_button.dart';

class ClientConfirm extends StatelessWidget {
  const ClientConfirm({super.key, required this.clientNotifier});

  final ClientNotifier clientNotifier;

  void snackBar({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Appointment Successfully Booked',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SelectedDayTimeEntity selectedDayTime =
        clientNotifier.value.selectedDayTime!;

    return Column(
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Please confirm that this day and time',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 100,
          color: Colors.grey.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Appointment:',
                ),
              ),
              Center(
                child: Text(
                  'On ${selectedDayTime.day} at ${selectedDayTime.time}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CustomSubmitButton(
          title: 'Confirm',
          onTap: () {
            //TODO: update selected times to the backend
            snackBar(context: context);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
