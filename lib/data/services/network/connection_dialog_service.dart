import 'dart:async';
import 'package:app_nation_case/core/constants/strings/app_strings.dart';
import 'package:app_nation_case/core/routes/app_routes.dart';
import 'package:app_nation_case/presentation/widgets/connection_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionDialogService {
  Completer<void>? _completer;

  Future<void> checkConnectionAndShowDialog({Function()? onCancel}) async {
    _completer = Completer<void>();

    final isConnected = await InternetConnectionChecker.I.hasConnection;

    if (!isConnected) {
      showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (_) {
          return ConnectionAlertDialog(actions: [
            TextButton(
              onPressed: () async {
                final recheck = await InternetConnectionChecker.I.hasConnection;
                if (recheck) {
                  Navigator.of(navigatorKey.currentContext!).pop();
                  _completer?.complete();
                }
              },
              child: Text(AppStrings.tryAgain),
            ),
            if (onCancel != null)
              TextButton(
                onPressed: () async {
                  Navigator.of(navigatorKey.currentContext!).pop();
                  onCancel.call();
                  _completer?.complete();
                },
                child: Text(AppStrings.cancel),
              ),
          ]);
        },
      );

      return _completer!.future;
    }
  }
}
