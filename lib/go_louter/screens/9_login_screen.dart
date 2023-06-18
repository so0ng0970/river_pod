import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:river_pd/go_louter/layout/default_layout.dart';
import 'package:river_pd/go_louter/route/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
            child: Text(
              authState ? 'logout' : 'login',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (GoRouter.of(context).location == '/login') {
                context.go('/login/private');
              } else {
                context.go('/login2/private');
              }
            },
            child: const Text(
              'Go to Private Route',
            ),
          ),
        ],
      ),
    );
  }
}
