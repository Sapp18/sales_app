import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/widgets/widgets.dart';

class ProjectBody2Widget extends StatelessWidget {
  final bool isLoading;
  final Color? backgroundColor;
  final double horizontalPadding;
  final List<Widget>? persistentFooterButtons;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? drawer;
  const ProjectBody2Widget({
    Key? key,
    required this.child,
    this.appBar,
    this.backgroundColor,
    this.drawer,
    this.horizontalPadding = 20,
    this.isLoading = false,
    this.persistentFooterButtons,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      color: ThemeColors.purple1,
      progressIndicator: const CustomCircularProgressWidget(),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: appBar,
          backgroundColor: backgroundColor,
          drawer: drawer,
          body: Padding(
            padding: horizontalPadding == 20
                ? const EdgeInsets.symmetric(horizontal: 20)
                : EdgeInsets.zero,
            child: SafeArea(
              child: child,
            ),
          ),
          persistentFooterButtons: persistentFooterButtons,
        ),
      ),
    );
  }
}
