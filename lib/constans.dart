import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF9d4edd);
const kPrimaryColorLight = Color(0xFFe0aaff);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFc77dff), kPrimaryColor]);
const kSencondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);
const kDisableDot = Color(0xFFD8D8D8);

// Form validations
final RegExp emailValidatorRegexp =
    RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]");
const String kEmailNullError = "Ingrese un email";
const String kInvalidEmailError = "Por favor ingrese un email válido";
const String kPassNullError = "Por favor ingrese la contraseña";
const String kPassTooShortError = "Contraseña muy corta";
const String kMatchPassError = "La contraseña no coincide";
