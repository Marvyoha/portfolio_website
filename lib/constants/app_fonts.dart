import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WriteStyles {
  static TextStyle header1Desktop(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 60,
      fontWeight: FontWeight.w700,
    );
  }
static TextStyle header1Tablet(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 48,
      fontWeight: FontWeight.w700,
    );
  }
   static TextStyle header1Mobile(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 36,
      fontWeight: FontWeight.w700,
    );
  }

    static TextStyle header2Desktop(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    );
  }

    static TextStyle header2TabletandMobile(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

    static TextStyle header3Desktop(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    );
  }

    static TextStyle header3TabletandMobile(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

    static TextStyle subtitleDesktop(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }

   static TextStyle subtitleTabletandMobile(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

   static TextStyle body1Desktop(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

   static TextStyle body1TabletandMobile(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

 static TextStyle body2(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }
  
   static TextStyle body3(BuildContext context) {
    return GoogleFonts.inter(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

}
