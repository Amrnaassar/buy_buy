import 'package:buy_buy/utils/constants.dart';
import 'package:flutter/material.dart';


class TOutlinedButtonTheme{
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme= OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: BorderSide(color: kMainColor),
      textStyle: TextStyle(fontSize:16,color: Colors.black,fontWeight: FontWeight.w600),
      padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))


    )
  );

  static final darkOutlinedButtonTheme= OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.blue),
          textStyle: TextStyle(fontSize:16,color: Colors.white,fontWeight: FontWeight.w600),
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))


      )
  );

}