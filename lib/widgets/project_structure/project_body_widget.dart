import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/themes/themes.dart';
import 'package:sales_app/widgets/widgets.dart';

class ProjectBodyWidget extends StatelessWidget {
  final bool isLoading;
  final bool showAppBar;
  final Color? backgroundColor;
  final double horizontalPadding;
  final List<Widget>? persistentFooterButtons;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? bottomSheet;
  final Widget? drawer;
  const ProjectBodyWidget({
    Key? key,
    required this.child,
    this.appBar,
    this.backgroundColor,
    this.bottomSheet,
    this.drawer,
    this.horizontalPadding = 20,
    this.isLoading = false,
    this.persistentFooterButtons,
    this.showAppBar = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (showAppBar) {
      return BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        color: ThemeColors.purple1,
        progressIndicator: const CustomCircularProgressWidget(),
        child: Scaffold(
          appBar: appBar ?? AppBar(),
          backgroundColor: backgroundColor,
          drawer: drawer,
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: horizontalPadding == 20
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : EdgeInsets.zero,
              child: SafeArea(
                child: child,
              ),
            ),
          ),
          persistentFooterButtons: persistentFooterButtons,
          bottomSheet: bottomSheet,
        ),
      );
    } else {
      return BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        color: ThemeColors.purple1,
        progressIndicator: const CustomCircularProgressWidget(),
        child: Scaffold(
          backgroundColor: backgroundColor,
          drawer: drawer,
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: horizontalPadding == 20
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : EdgeInsets.zero,
              child: SafeArea(
                child: child,
              ),
            ),
          ),
          persistentFooterButtons: persistentFooterButtons,
        ),
      );
    }
  }
}
