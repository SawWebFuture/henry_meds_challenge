import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:henry_meds_challenge/src/presentation/notifiers/client/client_notifier.dart';
import 'package:henry_meds_challenge/src/presentation/pages/client/client_page.dart';
import 'package:henry_meds_challenge/src/presentation/pages/home/widgets/home_member.dart';
import 'package:henry_meds_challenge/src/presentation/pages/provider/provider_page.dart';
import 'package:henry_meds_challenge/src/presentation/pages/shared_widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    GetIt.instance.registerFactory<ClientNotifier>(
      () => ClientNotifier(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Henry Meds Challenge'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 13),
              height: 80,
              color: Colors.white,
              child: Image.asset('assets/images/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeMember(
                    imageUrl: 'assets/images/provider.jpg',
                    memberType: 'Provider',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProviderPage()),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  HomeMember(
                    imageUrl: 'assets/images/client.jpg',
                    memberType: 'Client',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClientPage()),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(),
      ),
    );
  }
}
