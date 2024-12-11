// ignore_for_file: prefer_const_constructors
// usar app layout foi feito antes;
import 'package:flutter/material.dart';
// import 'package:myapp/calculadora.dart';
// import 'calculadora.dart' sl; 
import 'calculadora.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Calculadora Cientifica'),
      //home: const HomePage(title: 'Program of Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true, // acrescentado
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // colocado
          children: [
            // colocado
            Expanded(
              child: Container(
                alignment: Alignment.center, // Acrescentado
                // color: const Color.fromARGB(255, 20, 171, 188),
                // child: const Text('Layout superior'),
                //   child: const Text('Layout superior'),
                child: Container(),
              ),
            ),
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        // criado
                        // color: Colors.white,
                        // child: const Text('Firt Column'),
                        ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center, // Acrescentado
                      // color: Colors.greenAccent, //
                      // colocar a borda
                      decoration: BoxDecoration(
                        color: Colors.greenAccent, //
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.black, width: 5), // cor da borda

                        boxShadow: [
                          // colocar sombrar
                          BoxShadow(
                            color: Colors.black.withOpacity(0.20),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(10, 25),
                          ),
                        ],
                      ),
                      child: Calculadora(), // mudar aqui 
                      //  child: const Text('Calculadora Digital'),

                      // child: const Text('Second column'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        // criado
                        // color: Colors.blueAccent, // Comentado para evitar conflito
                        // child: const Text('Third column'),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center, // Acrescentado
                // color: const Color.fromARGB(255, 20, 126, 188),
                // child: const Text('Layout lower'),
              ),
            ),
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add), // icons in lower
        //  child: const Icon(Icons.add_shopping_cart), // icons in lower
      ),
    );
  }
}
