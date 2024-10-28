import 'package:flutter/material.dart';
import 'package:buy_buy/utils/theme/custom_themes/appbar_theme.dart';
import 'package:buy_buy/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:buy_buy/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:buy_buy/utils/theme/custom_themes/chip_theme.dart';
import 'package:buy_buy/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:buy_buy/utils/theme/custom_themes/input_Decoration_Theme.dart';
import 'package:buy_buy/utils/theme/custom_themes/outlined_Button_Theme.dart';
import 'package:buy_buy/utils/theme/custom_themes/text_theme.dart';

class TApptheme {
  TApptheme._();

  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme:TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme:TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme:TCheckboxTheme.lightCheckboxTheme,
    chipTheme:TChipTheme.lightChipTheme,
    outlinedButtonTheme:TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TInputDecorationTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme=ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      elevatedButtonTheme:TElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme:TBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme:TCheckboxTheme.darkCheckboxTheme,
      chipTheme:TChipTheme.darkChipTheme,
      outlinedButtonTheme:TOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TInputDecorationTheme.lightInputDecorationTheme,

  );


}