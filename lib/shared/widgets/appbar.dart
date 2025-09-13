import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pabitra_security/shared/helpers/dimens.dart';
import 'package:pabitra_security/shared/helpers/text_styles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Function? backPressed;
  final List<Widget>? actions;

  const CustomAppBar({super.key, this.title, this.backPressed, this.actions})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  final Size preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        enableFeedback: false,
        onTap: () {
          if (widget.backPressed == null) {
            Navigator.pop(context, true);
          } else {
            widget.backPressed!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing_24),
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        widget.title ?? "",
        style: text1F2024s16w600,
      ),
      actions: widget.actions,
    );
  }
}
