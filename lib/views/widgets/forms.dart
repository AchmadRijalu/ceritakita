import 'package:ceritakita/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String? title;
  final String hintText;
  final bool obscureText;
  final bool isPasswordField;
  final TextEditingController? controller;
  final bool isShowTitle;
  final TextInputType? keyBoardType;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;

  const CustomFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.isPasswordField = false,
    this.controller,
    this.isShowTitle = true,
    this.autovalidateMode,
    this.keyBoardType,
    this.validator,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _passwordObscured;

  @override
  void initState() {
    super.initState();
    _passwordObscured = true;
  }

  bool get _isObscured =>
      widget.isPasswordField ? _passwordObscured : widget.obscureText;

  Widget? get _suffixWidget {
    if (!widget.isPasswordField) return null;

    return GestureDetector(
      onTap: () => setState(() => _passwordObscured = !_passwordObscured),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Icon(
          _passwordObscured
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: greyColor,
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isShowTitle) ...[
          Text(
            widget.title!,
            style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
          ),
          const SizedBox(height: 12),
        ],
        TextFormField(
          cursorColor: blackColor,
          autovalidateMode: widget.autovalidateMode,
          keyboardType: widget.keyBoardType,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _isObscured,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(color: blackColor, width: 2.0),
            ),
            suffix: _suffixWidget,
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          ),
        ),
      ],
    );
  }
}
