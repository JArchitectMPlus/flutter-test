import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:srijan_flutter_test/di/viewmodels.dart';
import 'package:srijan_flutter_test/generated/l10n.dart';
import 'package:srijan_flutter_test/presentation/app/app_viewmodel.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/app_router.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/route_paths.dart';
import 'package:srijan_flutter_test/presentation/base/base_widget.dart';
import 'package:srijan_flutter_test/presentation/utils/color_utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AppViewModel>(
        providerBase: appViewModelProvider,
        builder: (context, model, child) => MaterialApp(
            key: model?.materialAppKey,
            builder: (context, widget) => ResponsiveBreakpoints.builder(
                  child: widget!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                    const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                    const Breakpoint(
                        start: 1921, end: double.infinity, name: '4K')
                  ],
                ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateTitle: (context) => S.of(context).appName,
            debugShowCheckedModeBanner: false,
            initialRoute: RoutePaths.quotes,
            theme: ThemeData(
              useMaterial3: true,
              primaryColor: AppColors.color1,
              textTheme: GoogleFonts.interTextTheme(),
              sliderTheme:
                  SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
              buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.accent,
                  highlightColor: AppColors.white,
                  splashColor: AppColors.white),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary: AppColors.color1,
                  onPrimary: AppColors.white,
                  secondary: AppColors.color2,
                  onSecondary: AppColors.color2,
                  brightness: Brightness.light),
              cardColor: AppColors.white,
              cardTheme: CardTheme(
                  color: AppColors.white,
                  surfaceTintColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 2),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              )),
              progressIndicatorTheme:
                  const ProgressIndicatorThemeData(color: AppColors.white),
              textSelectionTheme: TextSelectionThemeData(
                  cursorColor: AppColors.white,
                  selectionColor: AppColors.color3,
                  selectionHandleColor: AppColors.white),
              inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(
                    color: AppColors.color3.withOpacity(0.5),
                    fontSize: 23,
                    fontStyle: FontStyle.normal),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 1)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 1.2)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red, width: 1)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.white, width: 1.2)),
                errorStyle: TextStyle(color: AppColors.red),
                labelStyle: TextStyle(color: AppColors.color3, fontSize: 20),
              ),
            ),
            themeMode: ThemeMode.light,
            onGenerateRoute: AppRouter.generateRoute));
  }
}
