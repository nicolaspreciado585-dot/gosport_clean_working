import 'package:flutter/material.dart';
// Importaciones de las pantallas
import 'screens/login_screen.dart'; 
import 'screens/register_screen.dart'; 
import 'screens/home_screen.dart'; 

void main() => runApp(const GoSportApp());

class GoSportApp extends StatelessWidget {
  const GoSportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoSport App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false, 
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Roboto',
      ),
      // El Navegante: Rutas Nombradas (como en tu estructura original)
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(), 
        '/register': (context) => const RegisterScreen(), 
        '/home': (context) => const HomeScreen(), 
      },
    );
  }
}