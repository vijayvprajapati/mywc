import 'package:flutter/cupertino.dart';

class ValidationException implements Exception {
  String message;

  ValidationException(this.message);

  @override
  String toString() {
    return message;
  }
}

extension ValidationUtils on TextEditingController {
  String get getTrimText => text.trim();

  void checkEmpty(String errorMessage, {bool trim = true}) {
    var value = text;
    if (trim) {
      value = text.trim();
    }

    if (value.isEmpty) {
      throw ValidationException(errorMessage);
    }
  }

  void checkMin(int min, String errorMessage, {bool trim = true}) {
    var value = text;
    if (trim) {
      value = text.trim();
    }

    if (value.length <= min) {
      throw ValidationException(errorMessage);
    }
  }

  void matchRegExp(String regExp, String errorMessage, {bool trim = true}) {
    var value = text;
    if (trim) {
      value = text.trim();
    }

    if (!RegExp(regExp).hasMatch(value)) {
      throw ValidationException(errorMessage);
    }
  }
}

const String emailRegExp =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

const String passwordRegExp =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).{8,}$';
