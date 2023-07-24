import 'package:flutter/material.dart';

void navigator({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatorRemove({required BuildContext context, required Widget widget}) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
