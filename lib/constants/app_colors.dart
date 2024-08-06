import 'package:flutter/material.dart';


ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
     surface: Color(0xffFFFFFF), // BACKGROUND COLOR 
      inverseSurface: Color(0xffFFFFFF),// PROJECT CARD BACKGROUND
     scrim: Color(0xffF9FAFB),// PROJECT CARD BACKGROUND ALT
      primary: Color(0xff111827), // MAIN TEXT COLOR
      secondary: Color(0xFF4b5563), // SECONDARY TEXT COLOR (FOR SUBTITLES AND HEADER TEXT)
      tertiary: Color(0xffe5e7eb), // HEADER BACKGROUND COLOR
  )
);



ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      surface: Color(0xff030712), // BACKGROUND COLOR 
      inverseSurface: Color(0xff374151),//PROJECT CARD BACKGROUND,
        scrim: Color(0xff1f2937),// PROJECT CARD BACKGROUND ALT
      primary: Color(0xfff9fafb), // MAIN TEXT COLOR
      secondary: Color(0xFFd1d5db), // SECONDARY TEXT COLOR (FOR SUBTITLES AND HEADER TEXT)
      tertiary: Color(0xff374151), // HEADER BACKGROUND COLOR
  )
);