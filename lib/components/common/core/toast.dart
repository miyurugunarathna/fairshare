import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fairshare/constants/keys.dart';

enum ToastVariant {
  success,
  error,
  info,
  warning,
}

class Toast {
  static final FToast fToast = FToast();

  static bool initialized = false;

  static final _icons = {
    ToastVariant.success: const Icon(
      Icons.check_circle,
      color: Color.fromARGB(255, 14, 216, 122),
    ),
    ToastVariant.error: const Icon(
      Icons.error,
      color: Color.fromARGB(255, 212, 0, 0),
    ),
    ToastVariant.info: const Icon(
      Icons.info,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    ToastVariant.warning: const Icon(
      Icons.warning,
      color: Color.fromARGB(255, 255, 193, 7),
    ),
  };

  static void show(String message, {ToastVariant variant = ToastVariant.success, int? duration}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15), // Increased vertical padding
      constraints: const BoxConstraints(
        minHeight: 60.0, // Set minimum height
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _icons[variant]!,
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              style: Theme.of(GlobalKeys.navigatorKey.currentContext!).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            color: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () => fToast.removeCustomToast(),
          ),
        ],
      ),
    );
    if (!initialized) {
      fToast.init(GlobalKeys.navigatorKey.currentContext!);
      initialized = true;
    }
    fToast.showToast(child: toast, gravity: ToastGravity.CENTER, toastDuration: Duration(seconds: duration ?? 3));
  }

  static void success(String message, {int? duration}) {
    show(message, variant: ToastVariant.success, duration: duration);
  }

  static void error(String message, {int? duration}) {
    show(message, variant: ToastVariant.error, duration: duration);
  }

  static void info(String message, {int? duration}) {
    show(message, variant: ToastVariant.info, duration: duration);
  }

  static void warning(String message, {int? duration}) {
    show(message, variant: ToastVariant.warning, duration: duration);
  }
}
