import 'package:event_ticket_checker/views/HomeView.dart';
import 'package:event_ticket_checker/widgets/CustomButton.dart';
import 'package:event_ticket_checker/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              textEditingController: emailController,
              hintText: 'Email',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              textEditingController: passwordController,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  title: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomeView(),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
