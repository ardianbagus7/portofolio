import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:portofolio/features/portofolio/presentation/pages/portofolio_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portofolio/core/routes/routes.dart';
import 'package:portofolio/core/theme/themes.dart';
import 'package:portofolio/core/theme/theme_service.dart';
import 'package:portofolio/core/util/global_function.dart';

import '../injectable.dart';
import 'auth/presentation/bloc/auth_bloc.dart';
import 'auth/presentation/pages/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //* Localization
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('en', ''), // English
        Locale('id', 'ID'), // Indo
      ],

      //* Core
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => tr(context)!.appTitle,

      //* Routes
      getPages: Routes().getPages(),
      initialRoute: PortofolioPage.tag,

      //* Theme
      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,

      //* Builder
      builder: (context, widget) => ResponsiveWrapper.builder(
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
          child: BouncingScrollWrapper.builder(context, widget!),
        ),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
