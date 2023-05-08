import 'package:flutter/material.dart';
import 'package:sales_app/themes/themes.dart';

class TextRichWith3Widget extends StatelessWidget {
  final bool selectableText;
  final Color? color;
  final String text1;
  final String text2;
  final String text3;
  const TextRichWith3Widget({
    Key? key,
    required this.text1,
    this.color,
    this.selectableText = false,
    this.text2 = '',
    this.text3 = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: selectableText
          ? SelectableText.rich(
              TextSpan(
                text: text1,
                style: AppTypography.text16w500,
                children: <TextSpan>[
                  TextSpan(
                    text: text2,
                    style: AppTypography.text14w500.copyWith(
                      color: color ?? ThemeColors.white1,
                    ),
                  ),
                  TextSpan(
                    text: text3,
                    style: AppTypography.text16w500,
                  ),
                ],
              ),
            )
          : Text.rich(
              TextSpan(
                text: text1,
                style: AppTypography.text16w500,
                children: <TextSpan>[
                  TextSpan(
                    text: text2,
                    style: AppTypography.text14w500.copyWith(
                      color: color ?? ThemeColors.white1,
                    ),
                  ),
                  TextSpan(
                    text: text3,
                    style: AppTypography.text16w500,
                  ),
                ],
              ),
            ),
    );
  }
}
