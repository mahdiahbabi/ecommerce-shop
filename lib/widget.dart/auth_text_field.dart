import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.textEditingController,
    required this.icon,
    required this.lable,
    required this.suffixText,
    required this.isUsername,
    required this.keyboardType,
  });
  final TextEditingController textEditingController;
  final Icon icon;
  final String lable;
  final String suffixText;
  final bool isUsername;
  final TextInputType keyboardType;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      //TODO : prifix and suffix dont work
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          suffixIcon:
              widget.isUsername && widget.textEditingController.text.isNotEmpty
                  ? widget.icon
                  : null,
          suffixIconColor: Colors.green,
          labelText: widget.lable,
          suffixText: widget.textEditingController.text.isNotEmpty
              ? widget.suffixText
              : '',
          suffixStyle: TextStyle(color: Colors.green),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(35))),
    );
  }
}
