import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final TextInputType inputType;
  final String hintText;
  final bool hasError;
  final bool obscureText;
  final bool isEnabled;
  final bool isReadOnly;
  final bool isPassword;
  final double borderRadius;
  final Function(String)? onChanged;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;

  const CustomTextField({
    super.key,
    required this.textController,
    required this.hintText,
    this.hasError = false,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.isPassword = false,
    this.borderRadius = Dimens.spacing_14,
    this.decoration,
    this.onChanged,
    this.onTap,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: text1F2024s16w400,
      keyboardType: inputType,
      controller: textController,
      enabled: isEnabled,
      readOnly: isReadOnly,
      obscureText: isPassword,
      inputFormatters: inputFormatters ?? [],
      onChanged: (onChanged != null) ? onChanged : (value) {},
      onTap: (onTap != null) ? onTap : () {},
      decoration: (decoration != null)
          ? decoration
          : InputDecoration(
              errorText: hasError ? "" : null,
              errorStyle: const TextStyle(fontSize: 0),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: Dimens.spacing_18, horizontal: Dimens.spacing_24),
              filled: true,
              hintText: hintText,
              hintStyle: text7C8BA0s16w400,
              fillColor: const AppColors().whiteRgbaFFFFFF,
              hoverColor: const AppColors().whiteRgbaFFFFFF,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.blackC5C6CC),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.blackC5C6CC),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.redED3241),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blue006FFD),
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
    );
  }
}
