import 'package:flutter/material.dart';

showSnack(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), duration: Duration(seconds: 1)),
  );
}
