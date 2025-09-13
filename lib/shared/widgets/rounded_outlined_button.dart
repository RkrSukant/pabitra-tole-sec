import 'package:flutter/material.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';

class RoundedOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const RoundedOutlinedButton(
      {super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimens.spacing_40,
      child: OutlinedButton(
        onPressed: onPress,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 1.0,
            color: AppColors.blue006FFD,
            style: BorderStyle.solid,
          ),
          elevation: Dimens.spacing_0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.spacing_12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: text006FFDs14w600),
          ],
        ),
      ),
    );
  }
}
