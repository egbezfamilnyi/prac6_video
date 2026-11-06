import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: AppSession.name,
    );

    emailController = TextEditingController(
      text: AppSession.email,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void save() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    AppSession.update(
      nameController.text.trim(),
      emailController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Данные профиля обновлены'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void logout() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.login,
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundColor: Color(0xFFE8F5E9),
                          child: Icon(
                            Icons.person,
                            size: 75,
                            color: Colors.lightGreen,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Профиль пользователя',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 25),

                        CustomTextFormField(
                          inputType: InputFieldType.name,
                          labelText: 'ФИО',
                          hintText: 'Введите ФИО',
                          prefixIcon: Icons.person_outline,
                          controller: nameController,
                        ),

                        const SizedBox(height: 16),

                        CustomTextFormField(
                          inputType: InputFieldType.email,
                          labelText: 'Email',
                          hintText: 'example@mail.ru',
                          prefixIcon: Icons.email_outlined,
                          controller: emailController,
                        ),

                        const SizedBox(height: 16),

                        CustomTextFormField(
                          inputType: InputFieldType.password,
                          labelText: 'Пароль',
                          hintText: 'Введите новый пароль',
                          prefixIcon: Icons.lock_outline,
                          controller: passwordController,
                        ),

                        const SizedBox(height: 16),

                        CustomTextFormField(
                          inputType: InputFieldType.confirmPassword,
                          labelText: 'Повторите пароль',
                          hintText: 'Повторите новый пароль',
                          prefixIcon: Icons.lock_outline,
                          controller: confirmPasswordController,
                          passwordController: passwordController,
                          isLast: true,
                          onSubmitted: save,
                        ),

                        const SizedBox(height: 30),

                        Center(
                          child: SizedBox(
                            width: 250,
                            child: ElevatedButton.icon(
                              onPressed: save,
                              icon: const Icon(Icons.save_outlined),
                              label: const Text('Сохранить'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreen,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.all(16),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        TextButton.icon(
                          onPressed: logout,
                          icon: const Icon(Icons.logout),
                          label: const Text('Выйти из аккаунта'),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          const StudentFooter(),
        ],
      ),

      bottomNavigationBar: const AppNavigationBar(
        selectedIndex: 1,
      ),
    );
  }
}