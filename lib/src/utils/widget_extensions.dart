import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Route get route {
    return MaterialPageRoute(builder: (context) => this);
  }

  Widget padTop(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Widget padAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }
}
