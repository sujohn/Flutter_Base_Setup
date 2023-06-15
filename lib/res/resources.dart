import 'package:flutter/material.dart';
import 'package:flutter_base_setup/res/colors/app_colors.dart';
import 'package:flutter_base_setup/res/dimentions/app_dimentions.dart';
import 'package:flutter_base_setup/res/strings/bangla_strings.dart';
import 'package:flutter_base_setup/res/strings/english_strings.dart';
import 'package:flutter_base_setup/res/strings/strings.dart';

class Resources {

  BuildContext _context;

  Resources(this._context);

  AppColors get color => AppColors();

  AppDimentions get dimention => AppDimentions();

  Strings get strings {
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'bd':
        return BanglaStrings();
      default:
        return EnglishString();
    }
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}