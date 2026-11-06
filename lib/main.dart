import 'package:flutter/material.dart';

import 'routes.dart';

import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Форматы видеофайлов',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),

      initialRoute: Routes.loading,

      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.home: (context) => const HomePage(),
        Routes.profile: (context) => const ProfilePage(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == Routes.detail &&
            settings.arguments is VideoFormat) {
          final format = settings.arguments as VideoFormat;

          return MaterialPageRoute(
            settings: settings,
            builder: (context) => DetailPage(format: format),
          );
        }

        return null;
      },
    );
  }
}