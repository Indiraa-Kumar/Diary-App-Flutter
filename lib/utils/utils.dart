import 'package:flutter/material.dart';

class Utils {
  static void showToast(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        margin: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30),
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
