import 'package:flutter/material.dart';
import 'package:taxi_driver/common/color_extension.dart';
import 'package:taxi_driver/core/constants/sized_box_constants.dart';

class LineTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool isTitle;
  final Widget? right;
  final int minLines;
  final int maxLines;

  const LineTextField(
      {super.key,
        required this.title,
        required this.hintText,
        this.controller,
        this.keyboardType,
        this.obscureText,
        this.right,
        this.minLines = 1,
        this.maxLines = 1,
        this.isTitle = true,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
       if(isTitle) ...[
         Text(
           title,
           style: TextStyle(color: TColor.primaryText, fontSize: 14),
         ),
       ],
        SizedBoxConstants.sizedBoxH08,
        SizedBox(
          height: 40,
          child: TextField(
            textInputAction: TextInputAction.next,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            minLines: minLines,
            maxLines: maxLines,
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              errorMaxLines: 2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: TColor.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(255, 0, 0, 0.2),
                  width: 1,
                ),
              ),
              hintText: hintText,
              suffixIcon: right,
              contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              hintStyle: TextStyle(
                color: TColor.secondaryText,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

