@JS("taquitoBeaconWallet")
library taquito_wallet_beacon;

import 'package:js/js.dart';

@JS("BeaconWallet")
class BeaconWallet {
  external BeaconWallet(BeaconWalletOptions options);

  @JS("requestPermissions")
  external Future requestPermissions(
      Permissions requestPermissionInput);
}

@JS()
@anonymous
class BeaconWalletOptions {
  external String get name;
  external String get iconUrl;

  // Must have an unnamed factory constructor with named arguments.
  external factory BeaconWalletOptions({String name, String iconUrl});
}

@JS()
@anonymous
class Permissions {
  external Map<dynamic, String> get network;
  external List<String> get scopes;

  // Must have an unnamed factory constructor with named arguments.
  external factory Permissions({Map<dynamic, String> network, List<String> scopes});
}
