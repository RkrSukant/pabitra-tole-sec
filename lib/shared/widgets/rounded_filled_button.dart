import 'package:flutter/material.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';

class RoundedFilledButtonWidget extends StatefulWidget {
  final String text;
  final Color? buttonColor;
  final bool disable;

  final VoidCallback onPress;

  const RoundedFilledButtonWidget({
    super.key,
    required this.text,
    this.disable = false,
    required this.onPress,
    this.buttonColor,
  });

  @override
  State<RoundedFilledButtonWidget> createState() =>
      _RoundedFilledButtonWidgetState();
}

class _RoundedFilledButtonWidgetState extends State<RoundedFilledButtonWidget> {
  Color color = AppColors.blue006FFD;

  @override
  void initState() {
    super.initState();
      color = widget.buttonColor ?? AppColors.blue006FFD;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
          widget.disable ? AppColors.black8F9098 : color,
          elevation: Dimens.spacing_0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.spacing_12)),
        ),
        onPressed: widget.disable ? null : widget.onPress,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.spacing_18),
          child: Text(
            widget.text,
            style: textFFFFFFs16w600,
          ),
        ),
      ),
    );
  }
}