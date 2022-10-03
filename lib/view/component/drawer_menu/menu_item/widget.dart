import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem(
      {super.key,
      required this.buttonText,
      required this.icon,
      required this.onTap,
      required this.endItem});

  final String buttonText;
  final IconData icon;
  final VoidCallback onTap;
  final bool endItem;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: endItem
            ? const Border(
                top: BorderSide(color: HaikuKigoColors.borderColor),
                bottom: BorderSide(color: HaikuKigoColors.borderColor),
              )
            : const Border(
                top: BorderSide(color: HaikuKigoColors.borderColor),
              ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          buttonText,
          style: HaikuKigoTextStyle.small.copyWith(
            color: Colors.black,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
