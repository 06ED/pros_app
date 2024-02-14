import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_client.dart';
import '/resources/themes/styles/color_styles.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Helpers
|
| Add your helper methods here
|--------------------------------------------------------------------------
*/

/// helper to find correct color from the [context].
class ThemeColor {
  static ColorStyles get(BuildContext context, {String? themeId}) =>
      nyColorStyle<ColorStyles>(context, themeId: themeId);

  static Color fromHex(String hexColor) => nyHexColor(hexColor);
}

final client = OAuth2Client(
  authorizeUrl: getEnv("AUTH_URL"),
  tokenUrl: getEnv("TOKEN_URL"),
  redirectUri: getEnv("REDIRECT_URI"),
  customUriScheme: getEnv("AUTH_CALLBACK_SCHEME"),
);
