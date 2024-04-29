import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_code_structure/config/app_router_constants.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () {
                // Add your check account logic here
                bool accountAvailable = true; // Change this to check account availability
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Reset Password'),
                      content: Text(accountAvailable
                          ? 'An email with instructions has been sent to your email address.'
                          : 'No account found with this email address.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.go(AppRouteConstants.login);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
