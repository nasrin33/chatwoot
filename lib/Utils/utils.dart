import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: const Color.fromARGB(255, 60, 244, 54),
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  // ✅ Show loader using root navigator
  void showFullScreenLoader(BuildContext context) {
    showDialog(
      context: context,
      useRootNavigator: true, // ensure same navigator is used for hide
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // ✅ Hide loader safely
  void hideFullScreenLoader(BuildContext context) {
    try {
      Navigator.of(context, rootNavigator: true).pop();
    } catch (e) {
      debugPrint("Failed to hide loader: $e");
    }
  }
}
