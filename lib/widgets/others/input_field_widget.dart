import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_app/themes/themes.dart';

class InputFieldWidget extends StatelessWidget {
  final bool autofocus;
  final bool obscureText;
  final bool readOnly;
  final Color? colorTextFormField;
  final EdgeInsetsGeometry? content;
  final FocusNode? focusNode;
  final IconData? icon;
  final IconData? prefixIcon;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Map<String, dynamic> data;
  final String dataProperty;
  final String? counterText;
  final String? Function(String?)? validator;
  final String? helperText;
  final String? hintText;
  final String? initialValue;
  final String? labelText;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;

  const InputFieldWidget({
    Key? key,
    required this.data,
    required this.dataProperty,
    this.autofocus = false,
    this.colorTextFormField,
    this.content,
    this.controller,
    this.counterText,
    this.focusNode,
    this.helperText,
    this.hintText,
    this.icon,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.prefixIcon,
    this.readOnly = false,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: colorTextFormField ?? ThemeColors.onBackground,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        TextFormField(
          autofocus: autofocus,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          focusNode: focusNode,
          initialValue: initialValue,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          obscureText: obscureText,
          obscuringCharacter: '*',
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          readOnly: readOnly,
          style: AppTypography.text16w400White1,
          textCapitalization: textCapitalization,
          validator: validator,
          decoration: InputDecoration(
            // errorBorder: InputBorder.none,
            // contentPadding: EdgeInsets.only(bottom: 20),
            // enabledBorder: InputBorder.none,
            hintText: hintText,
            labelText: labelText,
            helperText: helperText,
            counterText: counterText,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            suffixIcon: suffixIcon,
            icon: icon == null ? null : Icon(icon),
          ),
          onChanged: (value) {
            data[dataProperty] = value.trim();
            onChanged!();
          },
        ),
      ],
    );
  }
}
