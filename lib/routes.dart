import 'package:flutter/material.dart';

class Routes {
  static const loading = '/';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const detail = '/detail';
  static const profile = '/profile';
}

class AppSession {
  static String name = 'Безфамильный Евгений Геннадьевич';
  static String email = '';

  static void login(String newEmail) {
    if (email != newEmail) {
      name = 'Пользователь';
    }
    email = newEmail;
  }

  static void register(String newName, String newEmail) {
    name = newName;
    email = newEmail;
  }

  static void update(String newName, String newEmail) {
    name = newName;
    email = newEmail;
  }
}

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      backgroundColor: Colors.lightGreen.shade50,
      indicatorColor: Colors.lightGreen.shade200,
      labelBehavior:
      NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: (index) {
        if (index == 0) {
          Navigator.popUntil(
            context,
                (route) => route.settings.name == Routes.home,
          );
        } else if (index == 1 && selectedIndex != 1) {
          Navigator.pushNamed(context, Routes.profile);
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Главная',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Профиль',
        ),
      ],
    );
  }
}