import 'package:ceritakita/shared/app_image.dart';
import 'package:ceritakita/shared/theme.dart';
import 'package:ceritakita/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsGeometry.symmetric(vertical:
        95, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage.logo.image(width: 122),
            const SizedBox(height: 24),
            Text("Welcome Back", style: blackTextStyle.copyWith(color: blackColor, fontWeight: bold, fontSize: 28)),
            const SizedBox(height: 4),
            Text("Sign in to Continue", style: blackTextStyle.copyWith(color: blackColor, fontWeight: regular, fontSize: 17)),
            const SizedBox(height: 16),
            CustomFilledButton(title: "Login")
          ],
        ),
      ),
    );
  }
}
