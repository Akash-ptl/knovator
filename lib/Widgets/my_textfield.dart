import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knovator/util/constants.dart';
import 'package:knovator/util/text_styles.dart';

import '../util/colors.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled(
      {Key? key,
      required this.controller,
      required this.hint,
      this.length,
      this.inputType,
      this.margin,
      this.maxLine,
      this.onChange,
      this.height = 0,
      this.enabled = true,
      this.color,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.textCapitalization,
      this.inputFormatters,
      this.hinttext,
      this.validator,
      this.style,
      this.errorText,
      this.maxLength})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final int? length;
  final inputType;
  final margin;
  final int? maxLine;
  final int? maxLength;
  final Function(String)? onChange;
  final double height;
  final bool enabled;
  final color;
  final prefixIcon;
  final suffixIcon;
  final bool obscureText;
  final textCapitalization;
  final inputFormatters;
  final hinttext;
  final validator;
  final errorText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          hint,
          style: textStyle.smallText
              .copyWith(color: colorHeadingText, fontFamily: 'MulishBold'),
        ),
        const SizedBox(
          height: constants.defaultPadding / 4,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextFormField(
            enabled: enabled,
            obscureText: obscureText,
            validator: validator,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            onChanged: onChange,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: length != null
                ? [
                    LengthLimitingTextInputFormatter(length),
                  ]
                : (inputFormatters ?? []),
            keyboardType: inputType,
            maxLines: maxLine ?? 1,
            maxLength: maxLength,
            style: style,
            decoration: InputDecoration(
              fillColor: colorTextField,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2, // Border width
                  color: Color(0xffccebc9), // Focus border color
                ),
                borderRadius: constants.borderRadius,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enabledBorder: InputBorder.none,
              errorText: errorText,
              errorStyle: const TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: constants.borderRadius,
              ),
              hintText: hinttext,
              hintStyle: textStyle.subHeading.copyWith(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                  fontFamily: 'Mulish'),

              // labelText: hint,
              // labelStyle: textStyle.subHeading.copyWith(color: colorDark,fontSize: 20.sp),
            ),
            onSaved: (v) {
              FocusScope.of(context).unfocus();
            },
            onFieldSubmitted: (v) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
