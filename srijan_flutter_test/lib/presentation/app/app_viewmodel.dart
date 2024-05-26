import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srijan_flutter_test/presentation/base/base_view_model.dart';
import 'package:srijan_flutter_test/presentation/utils/color_utils.dart';

class AppViewModel extends BaseViewModel {
  GlobalKey<NavigatorState> appLevelKey = GlobalKey(debugLabel: 'app-key');
  GlobalKey materialAppKey = GlobalKey();

  AppViewModel();

  List<ThemeData> getThemes() {
    return [
      ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
          primaryColor: AppColors.color1,
          colorScheme: ColorScheme.fromSwatch().copyWith(
              background: Colors.white,
              secondary: Colors.white,
              brightness: Brightness.light,
              onSecondary: AppColors.color2)),
    ];
  }
}
