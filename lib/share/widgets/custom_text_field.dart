import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController? controller;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardType;
  final List<String>? autofillHints;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
    this.isPassword = false,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.autofillHints,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true; // mặc định ẩn mật khẩu

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      validator: widget.validator,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      autofillHints: widget.autofillHints,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFA8A8A8),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF707070),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 22.h),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD0D0D0))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD0D0D0))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD0D0D0))),
      ),
    );
  }
}
