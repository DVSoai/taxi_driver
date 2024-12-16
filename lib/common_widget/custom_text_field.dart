
import 'package:flutter/material.dart';

import '../core/constants/sized_box_constants.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextStyle? labelStyle;
  final Color? requiredIconColor;
  final String hintText;
  final bool isLarge;
  final bool isRequire;
  final bool isPassword;
  final bool showPassword;
  final bool enabled;
  final bool isLabel;
  final Function()? toggleShowPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
     this.label,
    this.controller,
    this.focusNode,
    this.labelStyle,
    this.requiredIconColor,
    this.hintText = '',
    this.isLarge = false,
    this.isRequire = false,
    this.isPassword = false,
    this.showPassword = false,
    this.isLabel = false,
    this.enabled = true,
    this.toggleShowPassword,
    this.validator, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      if(isLabel) ...[
        Text.rich(
          TextSpan(text: label, children: [
            if (isRequire) ...[
              TextSpan(
                text: " *",
                style: labelStyle ??
                    TextStyle(
                      color: requiredIconColor ?? Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ]
          ]),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBoxConstants.sizedBoxH04,
      ],
        TextFormField(
          textInputAction: TextInputAction.next,
          focusNode: focusNode,
          validator: validator,
          enabled: enabled,
          keyboardType: keyboardType,
          maxLines: isLarge ? 3 : 1,
          obscureText: isPassword && !showPassword,
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: isPassword
                ? IconButton(
              onPressed: toggleShowPassword!,
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            )
                : null,
            hintText: hintText != '' ? hintText : '',
          ),
          // name: label,
        ),
      ],
    );
  }
}
