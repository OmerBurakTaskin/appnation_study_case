import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

void printIfDebug(Object object) {
  if (kDebugMode) {
    if (object is DioException) {
      debugPrint(object.stackTrace.toString());
      return;
    }
    debugPrint(object.toString());
  }
}
