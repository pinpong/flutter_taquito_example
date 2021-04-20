@JS("taquito")
library taquito;

import 'package:flutter_taquito_example/provider/beacon-wallet/beacon_wallet.dart';
import 'package:js/js.dart';

@JS("TezosToolkit")
class TezosToolkit {
  external TezosToolkit(String nodeUrl);

  @JS("setWalletProvider")
  external Future setWalletProvider(BeaconWallet wallet);
}
