import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/login.dart';
import 'package:flutter_application_2/utils/routes.dart';
import 'package:flutter_application_2/widgets/theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Catelog App',

    // home: MyApp(),

    themeMode: ThemeMode.light,
    theme: MyTheme.lightTheme(),
    darkTheme: ThemeData(brightness: Brightness.dark),
    initialRoute: Routes.HomeRoute,
    debugShowCheckedModeBanner: false,

    routes: {
      '/': ((context) => Login()),
      Routes.HomeRoute: ((context) => HomePage()),
      Routes.LoginRoute: ((context) => Login())
    },
  ));
}

class MyApp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
