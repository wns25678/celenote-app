import 'package:flutter/material.dart';

extension Content on BuildContext {
  double width([double percent = 1]) {
    return MediaQuery.sizeOf(this).width * percent;
  }

  double height([double percent = 1]) {
    return MediaQuery.sizeOf(this).height * percent;
  }
}
