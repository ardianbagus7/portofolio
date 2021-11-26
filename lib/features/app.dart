import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
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
      initialRoute: SplashScreen.tag,

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
          child: widget,
        ),
        maxWidth: 600,
        minWidth: 400,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(500, name: MOBILE),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
    );
  }
}
