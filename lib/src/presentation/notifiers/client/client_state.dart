import 'package:henry_meds_challenge/src/domain/entities/selected_day_time_entity.dart';

enum ClientStatus {
  list,
  reserve,
  confirm,
}

class ClientState {
  final ClientStatus status;
  final SelectedDayTimeEntity? selectedDayTime;
  final String errorMessage;

  ClientState({
    required this.status,
    this.selectedDayTime,
    this.errorMessage = '',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          selectedDayTime == other.selectedDayTime &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      status.hashCode ^ selectedDayTime.hashCode ^ errorMessage.hashCode;

  ClientState copyWith({
    ClientStatus? status,
    SelectedDayTimeEntity? selectedDayTime,
    String? errorMessage,
  }) {
    return ClientState(
      status: status ?? this.status,
      selectedDayTime: selectedDayTime ?? this.selectedDayTime,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
