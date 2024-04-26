import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/helper/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField(
      {super.key,
      required this.textStyle,
      required this.cursorColor,
      required this.label,
      required this.labelStyle,
      required this.filled,
      required this.fillColor,
      required this.focusedBorderColor, this.onChanged});
  final TextStyle textStyle;
  final Color cursorColor;
  final String label;
  final TextStyle labelStyle;
  final bool filled;
  final Color fillColor;
  final Color focusedBorderColor;
  final void Function(String)? onChanged;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;
  IconData suffixIcon = FontAwesomeIcons.eyeSlash;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:widget.onChanged ,
      validator: (value) {
        return FormValidators().strongPasswordValidator(value);
      },
      obscureText: obscureText,
      cursorColor: widget.cursorColor,
      style: widget.textStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(32, 16, 8, 16),
        label: Text(widget.label),
        labelStyle: widget.labelStyle,
        filled: widget.filled,
        fillColor: widget.fillColor,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.focusedBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = (!obscureText);
                if (obscureText) {
                  suffixIcon = FontAwesomeIcons.eyeSlash;
                } else {
                  suffixIcon = FontAwesomeIcons.eye;
                }
              });
            },
            child: Icon(
              suffixIcon,
              size: 20,
              color: Constans.subTitleColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
