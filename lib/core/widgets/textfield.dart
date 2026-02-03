import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String hint;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final TextEditingController controllerName;
  final bool pass;
  final String? errorText;

  const TextWidget({
    super.key,
    required this.hint,
    required this.controllerName,
    this.pass = false,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPressed,
    this.errorText,
  });

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controllerName,
      obscureText: widget.pass,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.labelText,
        errorText: widget.errorText, 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(widget.suffixIcon),
                onPressed: widget.onSuffixPressed,
              )
            : null,
      ),
    );
  }
}
