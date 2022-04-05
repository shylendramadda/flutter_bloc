import 'package:flutter/foundation.dart';

class URLController {
  static const String debugEndPoint = "https://localhost:9000";
  static const String releaseEndPoint = "https://release/api";

  static const String endPoint = kReleaseMode ? releaseEndPoint : debugEndPoint;
}
