import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.label,
      this.readonly,
      this.onTap,
      this.hintText,
      this.errorText,
      this.onChanged,
      this.inputFormatters,
      this.controller,
      this.inputType,
      this.maxLength});
  final bool? readonly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final int? maxLength;
  final String? label;
  final String? errorText;
  final String? hintText;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readonly ?? false,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.inputType,
      controller: widget.controller,
      onChanged: (text) {
        widget.onChanged?.call(text);
      },

      //focusNode: widget.focusNode,

      decoration: InputDecoration(
          label: widget.label == null ? null : Text(widget.label!),
          labelStyle: const TextStyle(color: Color(0xff998FA7)),
          errorText: widget.errorText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Color(0xff8933D4),
                //validated ?? false
                //   ? ColorManager.primary4
                //  : ColorManager.neuturals3
              )),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Color(0xff8933D4),

                // validated ?? false
                //     ? ColorManager.primary4
                //     : ColorManager.neuturals3
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Color(0xff8933D4),
              )),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Color(0xff8933D4),
              )),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                color: Color(0xff8933D4),

                // validated ?? false
                //     ? ColorManager.primary4
                //     : ColorManager.neuturals3
              )),
          hintText: widget.hintText ?? '',
          contentPadding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
          hintStyle: const TextStyle(
            color: Color(0xff998FA7),
            fontSize: 16,
            // validated ?? true
            //     ? ColorManager.neuturals4
            //     : ColorManager.primary3,
          )),
      cursorColor: const Color(0xff8933D4),
      style: const TextStyle(color: Color(0xff998FA7)),
      textAlignVertical: TextAlignVertical.center,
      cursorHeight: 16,
    );
  }
}
