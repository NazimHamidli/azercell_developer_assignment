import 'package:azercell_developer_assignment/src/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final bool active;
  final double height;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.active = false,
    this.height = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.blue,
        disabledBackgroundColor: const Color(0xff4C445C),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: active ? onPress : null,
      child: SizedBox(
        width: double.maxFinite,
        height: height,
        child: Center(
          child: Text(
            title.asValidString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
