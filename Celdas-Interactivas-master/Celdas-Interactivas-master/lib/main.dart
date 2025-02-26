import 'package:flutter/material.dart';
import 'package:tareauno/Listas.dart';
import 'package:tareauno/Login.dart';
import 'package:tareauno/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Grid Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Listas()
      //Login()
      //const MyHomePage(title: 'Tarea 1 Desarrollo Móvil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int gridSize = 6;
  final int grid2Size = 5;
  final List<Color> colors = [
    Colors.red,
    Colors.redAccent,
    Colors.pink,
    Colors.pinkAccent,
    Colors.purple,
    Colors.purpleAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.indigo,
    Colors.indigoAccent,
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.cyan,
    Colors.cyanAccent,
    Colors.teal,
    Colors.tealAccent,
    Colors.green,
    Colors.greenAccent,
    Colors.lightGreen,
    Colors.lightGreenAccent,
    Colors.lime,
    Colors.limeAccent,
    Colors.yellow,
    Colors.yellowAccent,  // Cambiado de orange
    Colors.amber,         // Nuevo color
    Colors.amberAccent,   // Nuevo color
    Colors.orange,        // Nuevo color
    Colors.orangeAccent,
    Colors.blueGrey,
  ];
  late List<Color> cellColors;
  late List<Color> textColors;

  @override
  void initState() {
    super.initState();
    cellColors = List.generate(gridSize * gridSize, (index) => colors[index % colors.length]); // Inicializa los colores de las celdas
    textColors = List.generate(gridSize * gridSize, (index) => Colors.white); // Inicializa los colores del texto (blanco por defecto)
  }

  void swapColors() {
    setState(() {
      int cont = 1;
      int cont2 = cont + 25;
      for(cont;cont<=5; cont++){
        final temp = cellColors[cont];
        cellColors[cont] = cellColors[cont2];
        cellColors[cont2] = temp;
        cont2++;
      }

    });
  }

  void swapText(int cellIndex) {
    setState(() {
      // Intercambia el color de la celda con el color del texto
      final temp = cellColors[cellIndex];
      cellColors[cellIndex] = textColors[cellIndex];
      textColors[cellIndex] = temp;
    });
  }


  void swapColorsTrias() {
    setState(() {
      final temp = cellColors[21];
      final temp2 = cellColors[22];
      cellColors[21] = cellColors[25];
      cellColors[25] = temp;
      cellColors[22] = cellColors[24];
      cellColors[24] = temp2;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Expanded( // <-- Expanded para que ocupe todo el espacio vertical
          child: Column(
            children: List.generate(gridSize, (rowIndex) {
              return Expanded(
                child: Row(
                  children: List.generate(grid2Size, (colIndex) {
                    final cellIndex = rowIndex * grid2Size + colIndex + 1;
                    final color = colors[cellIndex % colors.length];
                    return Expanded( // <-- Expanded para que las celdas se expandan en la fila
                      child: GestureDetector(
                        onTap: () {
                          print('Celda $cellIndex clickeada');
                          if (cellIndex <= 5) {

                            swapColors();
                          }
                          if (cellIndex >= 11 && cellIndex <= 15){
                            swapText(cellIndex);
                          }
                          if (cellIndex >= 16 && cellIndex <= 20){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Celda $cellIndex clickeada'),
                              ),
                            );
                          }
                          if (cellIndex >= 21 && cellIndex <= 25){
                            swapColorsTrias();
                          }
                          if (cellIndex >= 26 && cellIndex <= 30) {

                            swapColors();
                          }

                        },
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          color: cellColors[cellIndex], // Usa el color actual de la celda
                          child: Center(
                            child: Text(
                              '${cellIndex}',
                              style: TextStyle(
                                color: textColors[cellIndex],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}