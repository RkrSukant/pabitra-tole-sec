import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pabitra_security/shared/enums/toast_type.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget addDivider({Color color = AppColors.greyE8E9F1}) {
  return Expanded(
    child: Divider(
      height: 0,
      thickness: 1,
      color: color,
    ),
  );
}

extension ContextExtensions on BuildContext {
  void showToast(String title, ToastType type) {
    Color activeColor = AppColors.black1F2024;
    if (type == ToastType.success) {
      activeColor = AppColors.green0CCB6B;
    } else if (type == ToastType.info) {
      activeColor = AppColors.blue006FFD;
    } else if (type == ToastType.warning) {
      activeColor = AppColors.orangeFF962E;
    } else {
      activeColor = AppColors.redC51523;
    }
    var fToast = FToast();
    fToast.init(this);
    return fToast.showToast(
        gravity: ToastGravity.BOTTOM,
        child: Container(
          margin: const EdgeInsets.only(bottom: Dimens.spacing_0),
          height: Dimens.spacing_40,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: BoxDecoration(
            border: Border.all(color: activeColor),
            borderRadius: BorderRadius.circular(25.0),
            color: addWhite(activeColor, 0.9),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.spacing_2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  type == ToastType.success ? Icons.check_circle : Icons.info,
                  color: activeColor,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: text1F2024s12w700,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Color addWhite(Color color, double whitePercentage) {
  whitePercentage = whitePercentage.clamp(0.0, 1.0);

  int red = (color.red + ((255 - color.red) * whitePercentage)).toInt();
  int green = (color.green + ((255 - color.green) * whitePercentage)).toInt();
  int blue = (color.blue + ((255 - color.blue) * whitePercentage)).toInt();

  return Color.fromARGB(color.alpha, red, green, blue);
}

