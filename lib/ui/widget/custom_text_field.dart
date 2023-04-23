import 'package:flutter/material.dart';



class CustomTextField extends StatefulWidget {
   const CustomTextField(
      {Key? key, required this.label, required this.controller, this.typeKeyboard = TextInputType
          .text, this.validator, this.isPassword,this.inputAction=TextInputAction.next})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  final TextInputType typeKeyboard;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final TextInputAction inputAction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.inputAction,
      validator:widget.validator,
      controller: widget.controller,
      maxLines: 1,
      maxLength: 20,
      keyboardType: widget.typeKeyboard,
      obscureText: widget.isPassword??false,
      decoration: InputDecoration(
          label: Text(widget.label,), border: const OutlineInputBorder()),
    );
  }
}
