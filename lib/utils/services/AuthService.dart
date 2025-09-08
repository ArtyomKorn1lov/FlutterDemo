import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/alert.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class AuthService {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthentificate() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authentificate(BuildContext context) async {
    try {
      if (!await _canAuthentificate()) return false;

      return await _auth.authenticate(
        authMessages: const [
          AndroidAuthMessages(
            signInTitle: 'Авторизоваться',
            cancelButton: 'Нет, спасибо'
          ),
        ],
        localizedReason: 'Используйте биометрию для авторизации',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        )
      );
    } catch (error) {
      debugPrint('Ошибка $error');
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext alertContext) {
            return Alert(
              title: 'Ошибка',
              content: error.toString(),
            );
          },
        );
      }
      return false;
    }
  }
}