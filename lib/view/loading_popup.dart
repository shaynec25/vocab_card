import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoadingPopup extends StatelessWidget {
  LoadingPopup({super.key, required this.msg});
  String msg;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(msg),
    );
  }
}
