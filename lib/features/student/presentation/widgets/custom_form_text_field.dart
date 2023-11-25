import 'package:flutter/material.dart';
import 'package:task/utils/app_colors.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField(
      {super.key,
      this.hintText,
      this.label,
      required this.borderRadius,
      this.onChange,
      this.isHidden = false,
      this.maxLines = 1,
      this.onSaved,
      this.initialValue,
      required this.textInputType,
      this.validator,
      this.prefix});

  final int maxLines;

  final String? hintText;

  final String? label;

  final Widget? prefix;
  final void Function(String)? onChange;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final double borderRadius;

  final String? initialValue;
  final bool? isHidden;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      initialValue: initialValue,
      maxLines: maxLines,
      cursorColor: AppColor.darkGrey,
      obscureText: isHidden!,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        label: label == null ? null : Text('$label'),
        prefixIcon: prefix,
        // prefixIconColor: prefixIconColor,
        enabledBorder: buildEnableBorder(),
        border: buildEnableBorder(),
        focusedBorder: buildFocuseBorder(),
      ),
    );
  }

  OutlineInputBorder buildEnableBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: AppColor.primaryColor,
      ),
    );
  }

  OutlineInputBorder buildFocuseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: AppColor.black,
      ),
    );
  }
}
