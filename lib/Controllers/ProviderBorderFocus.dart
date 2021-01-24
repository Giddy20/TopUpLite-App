import 'package:flutter/material.dart';
import 'package:mybetter/Constants.dart';

Color providerCardClickAirtime = kLeadingGradient;
Color providerCardClickData = kLeadingGradient;

double focusBorderWidth = 1.0;

void focusedBorderAD(int num) {
  if (num == 1) {
    providerCardClickAirtime = kLeadingGradient;
    providerCardClickData = Color(0x10757575);
    providerCardClickSmile = Color(0x10757575);
    providerCardClickSpectranet = Color(0x10757575);
    providerCardClickSwift = Color(0x10757575);



  } else if (num == 2) {
    providerCardClickData = kLeadingGradient;
    providerCardClickAirtime = Color(0x10757575);
    providerCardClickSmile = Color(0x10757575);
    providerCardClickSpectranet = Color(0x10757575);
    providerCardClickSwift = Color(0x10757575);

  }
}



Color providerCardClickSmile = kLeadingGradient;
Color providerCardClickSpectranet = kLeadingGradient;
Color providerCardClickSwift = kLeadingGradient;


void focusedBorderBDT(int num) {
  if (num == 1) {
    providerCardClickSmile = Color(0x10757575);
    providerCardClickSpectranet = kLeadingGradient;
    providerCardClickSwift = Color(0x10757575);
    providerCardClickData = Color(0x10757575);
    providerCardClickAirtime = Color(0x10757575);


  }
  else if (num == 2) {
    providerCardClickSmile = kLeadingGradient;
    providerCardClickSpectranet = Color(0x10757575);
    providerCardClickSwift = Color(0x10757575);
    providerCardClickData = Color(0x10757575);
    providerCardClickAirtime = Color(0x10757575);


  }
  else if (num == 3) {
    providerCardClickSmile = Color(0x10757575);
    providerCardClickSpectranet = Color(0x10757575);
    providerCardClickSwift = kLeadingGradient;
    providerCardClickData = Color(0x10757575);
    providerCardClickAirtime = Color(0x10757575);


  }
}