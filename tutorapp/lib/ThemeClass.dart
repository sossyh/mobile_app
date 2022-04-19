import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Theme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.sourceCodePro(
      fontSize: 16.0,
      
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    headline1: GoogleFonts.sourceCodePro(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.sourceCodePro(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.sourceCodePro(
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline4: GoogleFonts.sourceCodePro(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.sourceCodePro(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: Colors.red,
    ),
  );

  static TextTheme darktextTheme = TextTheme(
    bodyText1: GoogleFonts.sourceCodePro(
      fontSize: 16.0,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
    headline1: GoogleFonts.sourceCodePro(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.sourceCodePro(
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displayLarge: GoogleFonts.sourceCodePro(
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline4: GoogleFonts.sourceCodePro(
        fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.white),
    headlineSmall: GoogleFonts.sourceCodePro(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: Colors.red,
    ),
  );
  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 209, 160, 241),
          shadowColor: Colors.tealAccent,
          elevation: 50.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.0))),
          centerTitle: true,
          //  primaryColorLight:Colors.cyan
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        ),
        primaryColorLight: Colors.cyan.shade400,
        hoverColor: Colors.cyan.shade100,

        );}
      static ThemeData dark(){
        return ThemeData(
            brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 209, 160, 241),
          shadowColor: Colors.tealAccent,
          elevation: 50.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.0))),
          centerTitle: true,
          //  primaryColorLight:Colors.cyan
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        ),
        primaryColorLight: Colors.cyan.shade400,
        hoverColor: Colors.cyan.shade100,

        );

        }

  }

