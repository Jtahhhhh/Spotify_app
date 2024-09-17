import 'package:flutter/material.dart';
import 'package:spotify_app/core/config/theme/app_color.dart';

class AppTheme{

  static final lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.lightBackGround,
    fontFamily: 'Satoshi',
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              color: const Color(0xff383838),
              fontWeight: FontWeight.w500
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(30),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.black,
                  width: 0.4
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.black,
                  width: 0.4
              )
          )
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );

  static final darkTheme = ThemeData(
      primaryColor: AppColor.primary,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: const Color(0xffa7a7a7),
            fontWeight: FontWeight.w500
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.all(30),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.6
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
              color: Colors.white,
              width: 0.6
          )
        )
      ),
      scaffoldBackgroundColor: AppColor.darkBackGround,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )
          )
      )
  );

}