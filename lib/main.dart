// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Styles/Theme/theme.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared.dart';
import 'package:shopping/Features/Main%20Screen/View/main_screen.dart';
import 'package:shopping/Features/Splash%20Screen/splash_screen.dart';
import 'package:shopping/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await MyShared.init();

  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (_) =>
      ThemeProvider()
        ..initialize(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
       return Consumer<ThemeProvider>(
         builder: (context, value, child) {
           return MaterialApp(
             key: ValueKey(MyShared.getCurrentLanguage()),
             debugShowCheckedModeBanner: false,
               locale: Locale(MyShared.getCurrentLanguage()),
             supportedLocales: S.delegate.supportedLocales,
             localizationsDelegates:const [
               S.delegate,
               GlobalMaterialLocalizations.delegate,
               GlobalCupertinoLocalizations.delegate,
               GlobalWidgetsLocalizations.delegate,
             ],
             theme: ThemeData(fontFamily: 'Poppins',),
             darkTheme: ThemeData.dark(),
             themeMode: value.themeMode,
             title: 'Shopping',
             home:  const MainScreen(),
           );

         },
       );
      },
    );
  }
}
