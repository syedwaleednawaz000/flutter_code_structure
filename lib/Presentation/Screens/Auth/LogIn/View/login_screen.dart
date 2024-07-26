import 'package:flutter/material.dart';
import 'package:flutter_code_structure/Presentation/Stripe/stripe_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_code_structure/config/app_router_constants.dart';
import 'package:provider/provider.dart';




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
                // Provider.of<StripeProvider>(context,listen: false).makePayment(bookingID: "45678", requestType: "fghj", price: 56, context: context);
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
