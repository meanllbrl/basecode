import 'package:animations/animations.dart';
import 'package:basecodev2/configurations/colorization.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

import '../configurations/typography.dart';


// ignore: must_be_immutable
class ThemeService extends StatelessWidget {
  final Widget child;

  // ignore: prefer_const_constructors_in_immutables
  ThemeService({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        }
      },
    themes: [
        AppTheme(
          id: "main",
          data: ThemeData(
            pageTransitionsTheme:  PageTransitionsTheme(
              builders: {
                TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.horizontal,
                  fillColor: Colorization.BACKGROUND_COLOR_1,
                ),
                TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.horizontal,
                  fillColor: Colorization.BACKGROUND_COLOR_1,
                ),
              },
            ),
            scaffoldBackgroundColor: Colorization.BACKGROUND_COLOR_1,
            primaryColor: Colorization.MAIN_COLOR_1,
            accentColor: Colorization.ACCENT_COLOR_1,
            textTheme:  TextTheme(
           bodyText2: CustomTypography.BODY_ALTERNATIVE_STLE,
              bodyText1: CustomTypography.BODY_STLE,
              caption: CustomTypography.CAPTION_STYLE,
              headline1: CustomTypography.HEADING_STLE,
            ),
          ),
          description: "main colors",
        ),
        AppTheme(
          id: "secondary",
          data: ThemeData(
            pageTransitionsTheme:  PageTransitionsTheme(
              builders: {
                TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.horizontal,
                  fillColor: Colorization.BACKGROUND_COLOR_2,
                ),
                TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.horizontal,
                  fillColor: Colorization.BACKGROUND_COLOR_2,
                ),
              },
            ),
            scaffoldBackgroundColor: Colorization.BACKGROUND_COLOR_2,
            primaryColor: Colorization.MAIN_COLOR_2,
            accentColor: Colorization.ACCENT_COLOR_2,
            textTheme:  TextTheme(
              bodyText2: CustomTypography.BODY_ALTERNATIVE_STLE,
              bodyText1: CustomTypography.BODY_STLE,
              caption: CustomTypography.CAPTION_STYLE,
              headline1: CustomTypography.HEADING_STLE,
            ),
          ),
          description: "secondary theme colors",
        ),
      ],
      child: ThemeConsumer(
        child: child,
      ),
    );
  }
}
