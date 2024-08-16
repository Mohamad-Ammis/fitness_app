import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({this.onChanged, super.key, required this.hint});
  String hint;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      validator: (data) {
        if (data!.isEmpty) {
          return 'required field';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField({
    this.onChanged,
    super.key,
    required this.hint,
  });
  String hint;
  bool hidetext = true;
  Function(String)? onChanged;
  int counter = 0;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'required field';
        }
        return null;
      },
      style: TextStyle(color: Colors.white),
      onChanged: widget.onChanged,
      obscureText: widget.hidetext,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: IconButton(
          onPressed: () {
            if (widget.counter.isEven) {
              widget.hidetext = false;
              widget.counter++;
            } else {
              widget.hidetext = true;
              widget.counter++;
            }
            setState(() {});
          },
          icon: Icon(
            Icons.visibility,
            color: Colors.white,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
