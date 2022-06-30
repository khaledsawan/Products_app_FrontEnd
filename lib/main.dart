import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:test1/routes/routes.dart';
import 'package:test1/utils/langs/translations.dart';
import 'package:test1/views/screens/crud/index_page.dart';
import 'init/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF60EE19),
        scaffoldBackgroundColor: Color(0xFFFDFFFA),
        secondaryHeaderColor: Color(0xFFBFECAB),
        backgroundColor: Color(0xFFD5F6E3),
        buttonColor: Color(0xFFE4F6E1),
        bottomAppBarColor: Color(0xFF282C28),
        cardColor: Color(0xFF46EFC3),
      ),
      translations: Translation(),
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //home: IndexPage(),
      initialRoute: AppRoutes.splashscreen,
     getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
