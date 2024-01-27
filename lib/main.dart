import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tarea 1 - Flutter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> buttonColors = List.filled(4, Colors.black);

  void iconColorSwitch(int buttonIndex) {
    setState(() {
      buttonColors[buttonIndex] = (buttonColors[buttonIndex] == Colors.black)
          ? Colors.indigo
          : Colors.black;
    });
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Saúl Iván Hernández Enríquez
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1 - Flutter'),
      ),
      body: Align(
        alignment: AlignmentDirectional.topStart,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar, título y texto adicional
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                        ),
                        SizedBox(width: 8.0),
                        Column(
                          children: [
                            Text(
                              'Flutter McFlutter',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Experienced App Developer'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                    height: 16.0), // Espacio entre el título y los iconos
                // Iconos
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildIconButton(Icons.timer, 'Timer', 0, '15m'),
                    buildIconButton(Icons.email, 'Email', 1, 'suli@iteso.mx'),
                    buildIconButton(Icons.call, 'Llamada', 2, '555-5555'),
                    buildIconButton(Icons.directions, 'Rutas', 3, 'Rosas 123'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, String tooltip, int buttonIndex,
      [String? title]) {
    return Column(
      children: [
        if (title != null) Text(title),
        IconButton(
          onPressed: () {
            iconColorSwitch(buttonIndex);
            showSnackBar('Se presionó el botón de $tooltip');
          },
          icon: Icon(icon),
          color: buttonColors[buttonIndex],
          tooltip: tooltip,
        ),
      ],
    );
  }
}
