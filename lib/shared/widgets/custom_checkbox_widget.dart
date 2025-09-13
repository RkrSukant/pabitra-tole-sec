import 'package:flutter/material.dart';
import 'package:pabitra_security/shared/helpers/colors.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';

class CustomCheckbox extends StatefulWidget {
  final bool isSelected;
  final double size;
  final bool removeRightPadding;
  final Color? buttonColor;

  const CustomCheckbox({
    super.key,
    this.size = Dimens.spacing_16,
    this.removeRightPadding = false,
    required this.isSelected,
    this.buttonColor,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isSelected;
  Color color = AppColors.blue006FFD;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (widget.removeRightPadding)
          ? const EdgeInsets.only(right: 0)
          : const EdgeInsets.only(right: 8.0), // Adjust padding as needed
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.spacing_4),
          child: Container(
            width: widget.size,
            // Set width and height to control size of checkbox
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.isSelected ? color : Colors.transparent,
              border: Border.all(
                color: widget.isSelected ? color : Colors.grey,
              ),
              borderRadius:
                  BorderRadius.circular(4.0), // Adjust for rounded corners
            ),
            alignment: Alignment.center,
            child: widget.isSelected
                ? const Icon(
                    Icons.check,
                    size: 14.0, // Adjust the size of the check mark
                    color: Colors.white,
                  )
                : null, // No icon when not selected
          ),
        ),
      ),
    );
  }
}
