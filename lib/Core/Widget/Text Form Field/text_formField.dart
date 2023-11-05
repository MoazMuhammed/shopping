import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    required this.hint,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    this.icon,
    required this.controller,
    required this.isPassword,
    this.validators,
    required this.textInputAction,
    required this.textInputType,
    this.obscureText = false,
    this.enable,
    this.isImage = false,
    this.prefixIcon,
    required this.iconColor,
    this.helperText,
  }) : super(key: key);
  final Color textColor;
  final Color iconColor;
  final String hint;
  final String? helperText;
  final bool isPassword;
  final bool isImage;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final IconData? icon;
  final bool? enable;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;

  late bool obscureText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validators,
      obscureText: widget.obscureText,
      controller: widget.controller,
      enabled: widget.enable,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      cursorColor: Theme.of(context).cardColor,
      decoration: InputDecoration(
        suffixIcon: Visibility(
          visible: widget.isPassword,
          child: InkWell(
            onTap: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
            child: Icon(
              widget.obscureText ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
            ),
          ),
        ),
        labelText: widget.hint,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.iconColor,
        ),
        helperText: widget.helperText,
        focusedBorder:const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),

    );
  }
}
