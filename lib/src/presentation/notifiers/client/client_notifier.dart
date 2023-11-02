import 'package:flutter/cupertino.dart';
import 'package:henry_meds_challenge/src/domain/entities/selected_day_time_entity.dart';

import 'client_state.dart';

class ClientNotifier extends ValueNotifier<ClientState> {
  ClientNotifier()
      : super(
          ClientState(status: ClientStatus.list),
        );

  void changeStatus({required ClientStatus status}) {
    value = value.copyWith(
      status: status,
    );
  }

  void addSelectedDayTime({required SelectedDayTimeEntity selectedDayTime}) {
    value = value.copyWith(
      status: ClientStatus.confirm,
      selectedDayTime: selectedDayTime,
    );
  }
}
