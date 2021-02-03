import 'package:flutter/material.dart';

import 'color_styles.dart';

class AppTheme {
  ThemeData themeData() {
    return ThemeData(
      accentColor: ColorApp.martinique,
      cursorColor: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: _appBarTheme(),
      textTheme: _textTheme().apply(
        fontFamily: 'Montserrat',
      ),
      tabBarTheme: _tabBarTheme(),
      buttonTheme: _buttonTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      iconTheme: IconThemeData(color: Colors.black54),
      fontFamily: 'Montserrat',
    );
  }

  ButtonThemeData _buttonTheme() {
    return ButtonThemeData(
      height: 48,
      buttonColor: Colors.white,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: ColorApp.grey35),
        borderRadius: new BorderRadius.circular(8),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      fillColor: Colors.white,
      errorStyle: TextStyle(color: Colors.yellow),
      errorBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple)),
    );
  }

  InputDecorationTheme inputDecorationThemeLogin() {
    return InputDecorationTheme(
      labelStyle: TextStyle(color: ColorApp.martinique),
      hintStyle: TextStyle(color: ColorApp.martinique),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorApp.martinique,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorApp.martinique,
        ),
      ),
      contentPadding: EdgeInsets.only(bottom: 5, top: 4),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      headline6: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: ColorApp.martinique),
      bodyText1: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: ColorApp.martinique),
      headline5: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorApp.martinique),
      headline4: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ColorApp.martinique),
      headline3: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ColorApp.martinique),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: ColorApp.martinique,
      ),
      button: TextStyle(
        fontSize: 16,
        color: ColorApp.mischka,
      ),
      caption: TextStyle(
          fontSize: 10, fontWeight: FontWeight.normal, color: ColorApp.mischka),
    );
  }

  AppBarTheme _appBarTheme() => AppBarTheme(
      color: Colors.white,
      textTheme: _textTheme().apply(fontFamily: 'Montserrat'),
      elevation: 0);

  TabBarTheme _tabBarTheme() => TabBarTheme(
        labelColor: ColorApp.martinique,
        unselectedLabelColor: ColorApp.martinique,
        indicator: BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(color: ColorApp.martinique, width: 3.0))),
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'Montserrat',
        ),
      );

  static InputDecorationTheme inputDecorationThemeCustom() =>
      InputDecorationTheme(
          labelStyle: TextStyle(color: ColorApp.martinique),
          hintStyle: TextStyle(color: ColorApp.martinique),
          focusColor: ColorApp.martinique,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorApp.martinique)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorApp.martinique)),
          errorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)));
}
