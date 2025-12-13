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
      theme: ThemeData(
        useMaterial3: false, 
        primarySwatch: Colors.teal,
      ),
      // El Navegante: Rutas Anónimas
      initialRoute: '/',
      routes: {
        // CORRECCIÓN DE ERROR FATAL: Quitamos 'const' de la llamada a la clase,
        // ya que la función anónima (context) => ... no es constante.
        '/': (context) => LoginScreen(), 
        '/register': (context) => RegisterScreen(), 
        '/home': (context) => HomeScreen(), 
      },
    );
  }
}