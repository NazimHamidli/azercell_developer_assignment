import 'package:flutter/material.dart';

extension StringExtensions on String? {
  bool get isValidString {
    return this != null && this!.trim().isNotEmpty && this!.trim() != 'null';
  }

  String asValidString([String fallback = 'N/A']) {
    return isValidString ? this! : fallback;
  }

  Widget buildTextWidget(bool showCard) {
    return Text(
      this!,
      style: const TextStyle(
        color: Color(0xff757575),
        fontSize: 20,
      ),
    );
  }

  List<Widget> buildTextWidgets(bool showCard) {
    List<Widget> widgets = [];
    for (int i = 0; i < this!.length; i += 4) {
      widgets.add(this!.substring(i, i + 4).buildTextWidget(showCard));
      if (i < this!.length - 4) {
        widgets.add(const SizedBox(width: 10));
      }
    }

    return widgets;
  }
}
