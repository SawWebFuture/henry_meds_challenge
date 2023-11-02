import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:henry_meds_challenge/src/presentation/notifiers/client/client_notifier.dart';
import 'package:henry_meds_challenge/src/presentation/notifiers/client/client_state.dart';
import 'package:henry_meds_challenge/src/presentation/pages/client/client_confirm/client_confirm.dart';
import 'package:henry_meds_challenge/src/presentation/pages/client/client_list/client_list.dart';
import 'package:henry_meds_challenge/src/presentation/pages/client/client_reserve/client_reserve.dart';
import 'package:henry_meds_challenge/src/presentation/pages/shared_widgets/custom_app_bar.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  late final ClientNotifier clientNotifier;

  @override
  void initState() {
    super.initState();
    clientNotifier = GetIt.I.get<ClientNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Client Page'),
        body: ValueListenableBuilder(
          valueListenable: clientNotifier,
          builder: (_, state, __) {
            return switch (state.status) {
              ClientStatus.list => ClientList(clientNotifier: clientNotifier),
              ClientStatus.reserve =>
                ClientReserve(clientNotifier: clientNotifier),
              ClientStatus.confirm => ClientConfirm(
                  clientNotifier: clientNotifier,
                ),
            };
          },
        ),
        // floatingActionButton: FloatingActionButton(),
      ),
    );
  }
}
