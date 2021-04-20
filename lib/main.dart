import 'package:flutter/material.dart';
import 'package:flutter_taquito_example/provider/beacon-sdk/beacon_sdk.dart';
import 'package:flutter_taquito_example/provider/beacon-wallet/beacon_wallet.dart';
import 'package:flutter_taquito_example/provider/taquito/tezos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taquito Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DAppClient? _dAppClient;
  TezosToolkit? _tezosToolkit;
  BeaconWallet? _beaconWallet;

  void _connect() async {
    _dAppClient = DAppClient(DAppClientOptions(name: "Example"));
    final permissions = await _dAppClient?.requestPermissions();

    _tezosToolkit = TezosToolkit("https://mainnet-tezos.giganode.io");

    _beaconWallet = BeaconWallet(BeaconWalletOptions(
        name: "Example",
        iconUrl:
            "https://pbs.twimg.com/profile_images/1175174515392778240/s92Gva_x.png"));

    await _beaconWallet?.requestPermissions(Permissions(network: {
      "type": 'mainnet'
    }, scopes: [
      'sign',
      'operation_request',
      'threshold',
    ]));

    _tezosToolkit!.setWalletProvider(_beaconWallet!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Taquito example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _connect, child: Text("CONNECT"))
            ],
          ),
        ));
  }
}
