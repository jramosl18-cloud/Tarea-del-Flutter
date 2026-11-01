
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bienvenido a la MATRIX',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.greenAccent,
          surface: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.greenAccent,
            fontFamily: 'monospace',
          ),
        ),
      ),
      home: const MatrixHomePage(),
    );
  }
}

class MatrixHomePage extends StatefulWidget {
  const MatrixHomePage({super.key});

  @override
  State<MatrixHomePage> createState() => _MatrixHomePageState();
}

class _MatrixHomePageState extends State<MatrixHomePage> {
  final TextEditingController _avatarController =
      TextEditingController();

  String _avatarGuardado = '';

  void _mostrarMensaje(String titulo, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.greenAccent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            titulo,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'monospace',
            ),
          ),
          content: Text(
            mensaje,
            style: const TextStyle(
              color: Colors.green,
              fontFamily: 'monospace',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'ACEPTAR',
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenido a la MATRIX',
          style: TextStyle(
            color: Colors.greenAccent,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: Colors.greenAccent,
            height: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),

              const Icon(
                Icons.terminal,
                size: 80,
                color: Colors.greenAccent,
              ),

              const SizedBox(height: 30),

              // Mensajes de estado
              Text(
                _avatarGuardado.isEmpty
                    ? 'ingrese su user name'
                    : 'estas dentro, usuario: $_avatarGuardado',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.greenAccent,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Campo de texto
              TextField(
                controller: _avatarController,
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontFamily: 'monospace',
                ),
                decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.greenAccent,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.greenAccent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Botón 1: Entrar
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  foregroundColor: Colors.greenAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(
                    color: Colors.greenAccent,
                  ),
                ),
                icon: const Icon(Icons.login),
                label: const Text('ENTRAR A LA MATRIX'),
                onPressed: () {
                  if (_avatarController.text.trim().isEmpty) {
                    _mostrarMensaje(
                      'ERROR',
                      'Por favor ingresa un user name válido.',
                    );
                  } else {
                    setState(() {
                      _avatarGuardado =
                          _avatarController.text.trim();
                    });

                    _mostrarMensaje(
                      'SISTEMA',
                      'Acceso confirmado. estas dentro.',
                    );
                  }
                },
              ),

              const SizedBox(height: 12),

              // Botón 2: Cambiar Username
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.greenAccent,
                  side: const BorderSide(
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const Icon(Icons.edit),
                label: const Text('CAMBIAR USER NAME'),
                onPressed: () {
                  if (_avatarGuardado.isEmpty) {
                    _mostrarMensaje(
                      'AVISO',
                      'Aún no has ingresado ningún user name.',
                    );
                  } else {
                    setState(() {
                      _avatarController.clear();
                      _avatarGuardado = '';
                    });

                    _mostrarMensaje(
                      'SISTEMA',
                      'ingrese su user name nuevamente.',
                    );
                  }
                },
              ),

              const SizedBox(height: 12),

              // Botón 3: Salir
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const Icon(
                  Icons.power_settings_new,
                ),
                label: const Text('SALIR DE LA MATRIX'),
                onPressed: () {
                  setState(() {
                    _avatarController.clear();
                    _avatarGuardado = '';
                  });

                  _mostrarMensaje(
                    'DESCONEXIÓN',
                    'Has salido de la Matrix. Regresando al mundo real...',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
