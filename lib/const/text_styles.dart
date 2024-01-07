import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wheather/const/Colors.dart';

abstract class ThemeText {
  static TextStyle alert_textstyle =
      TextStyle(color: CustomColors.whitetext, fontFamily: "GB");
  static TextStyle home_appbar_textstyle =
      TextStyle(color: CustomColors.whitetext, fontSize: 20, fontFamily: "GB");
  static TextStyle home_temp_itemlist_textstyle =
      TextStyle(fontSize: 64, color: CustomColors.whitetext);
  static TextStyle home_time_itemlist_textstyle =
      TextStyle(fontSize: 16, color: CustomColors.whitetext);
  static TextStyle home_name_itemlist_textstyle =
      TextStyle(fontSize: 36, color: CustomColors.whitetext);
  static TextStyle home_main_itemlist_textstyle =
      TextStyle(fontSize: 64, color: CustomColors.whitetext);
  static TextStyle search_appbar_textstyle =
      TextStyle(color: CustomColors.whitetext, fontFamily: "GB", fontSize: 32);
  static TextStyle search_hint_component_textstyle =
      TextStyle(color: CustomColors.gray, fontFamily: "GM", fontSize: 16);
}
