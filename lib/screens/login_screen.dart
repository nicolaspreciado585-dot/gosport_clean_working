import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Esta es la pantalla de Login'),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de Home
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Ir a Home'),
            ),
            TextButton(
              onPressed: () {
                // Navegar a la pantalla de Registro
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}