import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista de canchas para ListView.builder
  final List<Map<String, dynamic>> canchas = [
    {
      'nombre': 'Cancha Bosa 1',
      'deporte': 'Fútbol',
      'precio': 80000,
      'ubicacion': 'Bosa Centro',
      'disponible': true,
    },
    {
      'nombre': 'Cancha Tenis Norte',
      'deporte': 'Tenis',
      'precio': 45000,
      'ubicacion': 'Suba',
      'disponible': true,
    },
    {
      'nombre': 'Cancha Baloncesto',
      'deporte': 'Baloncesto',
      'precio': 60000,
      'ubicacion': 'Kennedy',
      'disponible': false,
    },
    {
      'nombre': 'Cancha Fútbol 5',
      'deporte': 'Fútbol',
      'precio': 70000,
      'ubicacion': 'Engativá',
      'disponible': true,
    },
    {
      'nombre': 'Cancha Voleibol',
      'deporte': 'Voleibol',
      'precio': 50000,
      'ubicacion': 'Usaquén',
      'disponible': true,
    },
  ];

  String userEmail = 'usuario@gosport.com';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtener el email pasado como argumento desde el login
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      setState(() {
        userEmail = args;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoSport'),
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Mostrar confirmación antes de cerrar sesión
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Cerrar Sesión'),
                  content: const Text('¿Estás seguro que deseas cerrar sesión?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Cerrar diálogo
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        );
                      },
                      child: const Text('Cerrar Sesión'),
                    ),
                  ],
                ),
              );
            },
            tooltip: 'Cerrar Sesión',
          ),
        ],
      ),
      body: Column(
        children: [
          // Header con información del usuario usando Container avanzado
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal[800]!, Colors.teal[600]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.teal[800],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '¡Bienvenido!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            userEmail,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Sección de título con Row
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.sports, size: 28, color: Colors.teal[800]),
                const SizedBox(width: 10),
                const Text(
                  'Canchas Disponibles',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // ListView.builder para mostrar las canchas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: canchas.length,
              itemBuilder: (context, index) {
                final cancha = canchas[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Imagen placeholder con gradiente
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.teal[400]!,
                              Colors.teal[700]!
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            _getIconForDeporte(cancha['deporte']),
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      
                      // Información de la cancha
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row con nombre y badge de disponibilidad
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    cancha['nombre'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: cancha['disponible']
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    cancha['disponible']
                                        ? 'Disponible'
                                        : 'Ocupada',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            
                            // Row con deporte y ubicación usando Flexible
                            Row(
                              children: [
                                Icon(Icons.sports_soccer,
                                    size: 18, color: Colors.grey[600]),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    cancha['deporte'],
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Icon(Icons.location_on,
                                    size: 18, color: Colors.grey[600]),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    cancha['ubicacion'],
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            
                            // Row con precio y botón
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${_formatNumber(cancha['precio'])}/hora',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: cancha['disponible']
                                      ? () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Reservando ${cancha['nombre']}'),
                                              backgroundColor: Colors.green,
                                              duration: const Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal[800],
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    disabledBackgroundColor: Colors.grey[400],
                                  ),
                                  child: const Text('Reservar'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForDeporte(String deporte) {
    switch (deporte.toLowerCase()) {
      case 'fútbol':
        return Icons.sports_soccer;
      case 'tenis':
        return Icons.sports_tennis;
      case 'baloncesto':
        return Icons.sports_basketball;
      case 'voleibol':
        return Icons.sports_volleyball;
      default:
        return Icons.sports;
    }
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}