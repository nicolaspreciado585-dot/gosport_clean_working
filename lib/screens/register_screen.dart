import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Esta es la pantalla de Registro'),
            ElevatedButton(
              onPressed: () {
                // Volver a la pantalla de Login (initialRoute)
                Navigator.pop(context);
              },
              child: const Text('Volver al Login'),
            ),
          ],
        ),
      ),
    );
  }
}