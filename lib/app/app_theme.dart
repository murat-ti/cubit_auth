import 'package:cubit_auth/app/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData get mainAppThemeData => ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: AppConstants.themeFontSize,
          color: AppConstants.themeColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppConstants.themeColor,
          ),
        ),
        alignLabelWithHint: true,
      ),
    );
