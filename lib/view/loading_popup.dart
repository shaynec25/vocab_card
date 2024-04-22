import 'package:flutter/material.dart';

class LoadingPopup extends StatelessWidget {
  const LoadingPopup({
    super.key,
    required this.msg,
  });
  final String msg;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(msg),
    );
  }
}
