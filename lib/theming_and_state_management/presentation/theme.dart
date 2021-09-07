import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final Color purple = Color(0xFF5117AC);
  static final Color green = Color(0xFF20D0C4);
  static final Color dark = Color(0xFF03091E);
  static final Color grey = Color(0xFF212738);
  static final Color lightGrey = Color(0xFFBBBBBB);
  static final Color veryLightGrey = Color(0xFFF3F3F3);
  static final Color white = Color(0xFFFFFFFF);
  static final Color pink = Color(0xFFF56388);
}

final deliveryGradient = [
  DeliveryColors.green,
  DeliveryColors.purple,
];

final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
        color: DeliveryColors.veryLightGrey,
        width: 2,
        style: BorderStyle.solid));

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
);

final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: DeliveryColors.white,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            headline6: TextStyle(
          fontSize: 20,
          color: DeliveryColors.purple,
          fontWeight: FontWeight.bold,
        ))),
    accentColor: DeliveryColors.purple,
    bottomAppBarColor: DeliveryColors.lightGrey,
    canvasColor: DeliveryColors.white,
    buttonColor: DeliveryColors.purple,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: DeliveryColors.purple,
      displayColor: DeliveryColors.purple,
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.lightGrey,
          fontSize: 10,
        )),
    iconTheme: IconThemeData(
      color: DeliveryColors.purple,
    ));

final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: DeliveryColors.purple,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            headline6: TextStyle(
          fontSize: 20,
          color: DeliveryColors.white,
          fontWeight: FontWeight.bold,
        ))),
    accentColor: DeliveryColors.white,
    bottomAppBarColor: Colors.transparent,
    canvasColor: DeliveryColors.grey,
    buttonColor: DeliveryColors.purple,
    scaffoldBackgroundColor: DeliveryColors.dark,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: DeliveryColors.green,
      displayColor: DeliveryColors.green,
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        filled: true,
        fillColor: DeliveryColors.grey,
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.white,
          fontSize: 10,
        )),
    iconTheme: IconThemeData(
      color: DeliveryColors.white,
    ));
