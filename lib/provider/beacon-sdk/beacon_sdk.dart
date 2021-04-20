@JS("beacon")
library beacon_sdk;

import 'package:js/js.dart';

@JS("DAppClient")
class DAppClient {
  external DAppClient(DAppClientOptions options);

  @JS("requestPermissions")
  external Future<dynamic> requestPermissions();
}

@JS()
@anonymous
class DAppClientOptions {
  external String get name;

  // Must have an unnamed factory constructor with named arguments.
  external factory DAppClientOptions({String? name});
}
