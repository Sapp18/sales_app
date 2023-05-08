import 'package:flutter/material.dart';
import 'package:sales_app/themes/themes.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: ThemeColors.white1,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'o',
            style: AppTypography.text14w400White1,
          ),
        ),
        const Expanded(
          child: Divider(
            color: ThemeColors.white1,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
