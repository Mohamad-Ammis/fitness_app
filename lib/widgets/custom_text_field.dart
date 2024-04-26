import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/helper/form_validators.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textStyle,
    required this.cursorColor,
    required this.label,
    required this.labelStyle,
    required this.filled,
    required this.fillColor,
    required this.focusedBorderColor,
    required this.suffixIcon,
    this.isEmail,
    this.isUserName,
    this.onChanged
  });
  final TextStyle textStyle;
  final Color cursorColor;
  final String label;
  final TextStyle labelStyle;
  final bool filled;
  final Color fillColor;
  final Color focusedBorderColor;
  final IconData suffixIcon;
  final bool? isEmail;
  final bool? isUserName;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      validator: (value) {
        if (isEmail ?? false) {
          return FormValidators().emailValidator(value);
        } else if (isUserName ?? false) {
          return FormValidators().userNameValidator(value);
        } else {
          return null;
        }
      },
      cursorColor: cursorColor,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 8, 16),
        label: Text(label),
        labelStyle: labelStyle,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            suffixIcon,
            color: Constans.subTitleColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
