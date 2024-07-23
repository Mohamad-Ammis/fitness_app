import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField(
      {super.key,
      required this.textStyle,
      required this.cursorColor,
      required this.label,
      required this.labelStyle,
      required this.filled,
      required this.fillColor,
      required this.focusedBorderColor,
      required this.onSaved,
      required this.validatpass,
      required this.enabledBorderColor,
      this.controllerText,
      this.suffixIconColor});
  final TextStyle textStyle;
  final Color cursorColor;
  final String label;
  final TextStyle labelStyle;
  final bool filled;
  final Color fillColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color? suffixIconColor;
  final void Function(String?)? onSaved;
  String? Function(String?)? validatpass;
  TextEditingController? controllerText;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;
  IconData suffixIcon = FontAwesomeIcons.eyeSlash;
  // Controller controller = Get.put(Controller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: TextFormField(
        controller: widget.controllerText,
        onSaved: widget.onSaved,
        validator: widget.validatpass,
        obscureText: obscureText,
        cursorColor: widget.cursorColor,
        style: widget.textStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(32, 16, 8, 16),
          label: Text(widget.label),
          labelStyle: widget.labelStyle,
          filled: widget.filled,
          fillColor: widget.fillColor,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: widget.enabledBorderColor, width: 0.4),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: widget.focusedBorderColor, width: 0.5),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5),
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
                size: 17,
                color: const Color(0xFF1F1E28),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
