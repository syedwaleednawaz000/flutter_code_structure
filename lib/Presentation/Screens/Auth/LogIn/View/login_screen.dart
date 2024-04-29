import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_code_structure/config/app_router_constants.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                context.go(AppRouteConstants.dashBoardScreen);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                context.go(AppRouteConstants.forgot);
              },
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                context.go(AppRouteConstants.registration);
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
