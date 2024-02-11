import 'package:flutter/material.dart';

class inputField extends StatefulWidget {
  final IconData? icons;
  final String hint;
  final bool obScureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController fieldController;
  final TextInputType keyboard;

  const inputField({
    Key? key,
    this.icons,
    required this.hint,
    required this.fieldController,
    required this.validator,
    this.keyboard = TextInputType.text,
    this.obScureText = false,
  }) : super(key: key);

  @override
  State<inputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<inputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fieldController,
      validator: widget.validator,
      keyboardType: widget.keyboard,
      obscureText: widget.obScureText,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icons),
        prefixIconColor: const Color.fromARGB(255, 189, 189, 189),
        hintText: widget.hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color(0xff7d5fff),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color(0xff7d5fff),
          ),
        ),
        focusColor: const Color(0xff7d5fff),
        filled: true,
        fillColor: const Color.fromARGB(255, 71, 71, 71),
      ),
    );
  }
}
