import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stellar/util/stellar_client.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  StellarClient stellarClient = StellarClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('stellar client'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("_event"),
          onPressed: () async {
            String mnemonic = await stellarClient.mnemonic();
            String sseed = stellarClient.secretSeed();
            log(mnemonic);
            log(sseed);
          },
        ),
      ),
    );
  }
}
